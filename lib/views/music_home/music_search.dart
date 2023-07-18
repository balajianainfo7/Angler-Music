import 'dart:async';

import 'package:angler_music/controllers/music_player_controller.dart';
import 'package:angler_music/models/music_player_model.dart';
import 'package:angler_music/views/music_home/music_detailed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MusicDetailedPage extends StatefulWidget {
  const MusicDetailedPage({super.key});

  @override
  State<MusicDetailedPage> createState() => MusicDetailedPageState();
}

class MusicDetailedPageState extends State<MusicDetailedPage> {
  final controller = Get.find<MusicPlayerController>();
  @override
  void initState() {
    controller.fetchMusic();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_circle_left_outlined,
                color: Colors.white,
              )),

          iconTheme: IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF134FAF), Color(0xFF134FAF)]),
            ),
          ),
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 4 / 7,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF134FAF), Color(0xFF134FAF)],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 7.7),
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF134FAF), Colors.black],
                ),
              ),
            ),
            Positioned(
                top: 15,
                left: 20,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Search Your Favorite Music!!',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white.withOpacity(0.9),
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                )),
            Positioned(
              top: 140,
              left: 20,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Playlists',
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.white,
                            fontFamily: "Raleway",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: TextField(
                          controller: controller.searchController,
                          onChanged: (v) {
                            if (controller.timer?.isActive ?? false)
                              controller.timer?.cancel();
                            controller.timer =
                                Timer(const Duration(seconds: 1), () {
                              controller.fetchMusic();
                            });
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.search,
                                color: Color(0xFF134FAF),
                              ),
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.clear),
                                onPressed: controller.searchController.clear,
                              ),
                              hintText: 'Search playlists',
                              hintStyle: TextStyle(
                                  fontFamily: "Raleway",
                                  color: Color(0xFF134FAF)),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(top: 160),
              child: Container(
                  child: StreamBuilder<List<MusicPlayerModel>>(
                      stream: controller.getMusicModel(),
                      initialData: [],
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return Center(
                              child: Center(
                                child: Container(
                                    height: 80,
                                    width: 80,
                                    alignment: AlignmentDirectional.center,
                                    child: Lottie.asset(
                                      "assets/loading/music.json",
                                    )),
                              ),
                            );
                          default:
                            if (snapshot.hasError) {
                              return Center(
                                  child: Text('Some error occurred!'));
                            } else {
                              print("snapshot.data");
                              print(snapshot.data);

                              List<MusicPlayerModel> musicList = snapshot.data!
                                  .where((item) =>
                                      item.artistName.toLowerCase().contains(
                                          controller.searchController.text
                                              .toLowerCase()) ||
                                      item.trackName.toLowerCase().contains(
                                          controller.searchController.text
                                              .toLowerCase()) ||
                                      item.primaryGenreName
                                          .toLowerCase()
                                          .contains(controller
                                              .searchController.text
                                              .toLowerCase()))
                                  .toList();
                              print(musicList);
                              print("musicList");
                              return musicList.length == 0
                                  ? Container(
                                      child: Center(
                                        child: Text(
                                          "No result",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: "Raleway",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        ),
                                      ),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: musicList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var music = musicList[index];

                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MusicPlayerDetailedPage(
                                                          artistName:
                                                              music.artistName,
                                                          artworkUrl30: music
                                                              .artworkUrl30,
                                                          trackName:
                                                              music.trackName,
                                                        )));
                                          },
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 25, left: 13, right: 13),
                                              child: Card(
                                                elevation: 50,
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                child: SizedBox(
                                                  width: 380,
                                                  height: 80,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 8),
                                                    child: Container(
                                                      child: Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 5,
                                                                    left: 10),
                                                            child: CircleAvatar(
                                                                radius: 22,
                                                                child: CircleAvatar(
                                                                    radius: 22,
                                                                    backgroundImage:
                                                                        NetworkImage(
                                                                            "${music.artworkUrl30}"))),
                                                          ),
                                                          SizedBox(
                                                            width: 10,
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          10,
                                                                      left: 8),
                                                              child:
                                                                  SingleChildScrollView(
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Align(
                                                                        alignment:
                                                                            Alignment
                                                                                .centerLeft,
                                                                        child:
                                                                            Text(
                                                                          "${music.trackName}",
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                17,
                                                                            color:
                                                                                Colors.black,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily:
                                                                                "Raleway",
                                                                          ),
                                                                        )),
                                                                    Padding(
                                                                        padding: EdgeInsets.only(
                                                                            top:
                                                                                5),
                                                                        child:
                                                                            Text(
                                                                          "${music.artistName}",
                                                                          style: TextStyle(
                                                                              fontSize: 13,
                                                                              color: Colors.black54,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "Raleway"),
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 5,
                                                                    right: 10),
                                                            child: Container(
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {
                                                                          print(
                                                                              "aa");
                                                                        },
                                                                        icon: Icon(
                                                                            Icons
                                                                                .play_circle_outline_outlined,
                                                                            color:
                                                                                Color(0xFF134FAF)))),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      });
                            }
                        }
                      })),
            )
          ],
        ),
      ),
    );
  }
}
