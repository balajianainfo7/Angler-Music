import 'dart:async';
import 'dart:ui';

import 'package:angler_music/controllers/music_player_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class MusicPlayerDetailedPage extends StatefulWidget {
  final String artistName;
  final String trackName;
  final String artworkUrl30;
  const MusicPlayerDetailedPage(
      {super.key,
      required this.artistName,
      required this.trackName,
      required this.artworkUrl30});

  @override
  State<MusicPlayerDetailedPage> createState() =>
      MusicPlayerDetailedPageState();
}

class MusicPlayerDetailedPageState extends State<MusicPlayerDetailedPage> {
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
          title:  Text(
              "${widget.trackName}",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontFamily: "Raleway",
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          
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
                      Card(
                        elevation: 50,
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: SizedBox(
                          width: 350,
                          height: 400,
                          child: Container(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 380,
                                    width: 340,
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      child: Image(
                                        image: NetworkImage(
                                            "${widget.artworkUrl30}"),
                                        fit: BoxFit.cover,
                                        height: 380,
                                        width: 340,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 160),
                child: Container(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 295, left: 30, right: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            "${widget.trackName}",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Raleway",
                                            ),
                                          )),
                                      Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: Text(
                                            "${widget.artistName}",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Raleway"),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 290, right: 5),
                              child: Container(
                                  child: IconButton(
                                      onPressed: () {
                                        print("aa");
                                      },
                                      icon: Icon(Icons.bookmarks_rounded,
                                          color: Colors.white))),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 20, top: 26),
                          child: StepProgressIndicator(
                            totalSteps: 100,
                            currentStep: 32,
                            size: 8,
                            padding: 0,
                            selectedColor: Colors.white,
                            unselectedColor: Color(0xFF134FAF),
                            roundedEdges: Radius.circular(10),
                            selectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.white, Colors.white],
                            ),
                            unselectedGradientColor: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF134FAF), Color(0xFF134FAF)],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_left_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Icon(
                                Icons.play_circle_outline_outlined,
                                color: Colors.white,
                                size: 55,
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_right_rounded,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(
                                width: 35,
                              ),
                              Icon(
                                Icons.shuffle_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 20),
                          child: Row(
                            children: [
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 280,
                              ),
                              Icon(
                                Icons.download_for_offline_rounded,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
