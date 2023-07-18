import 'package:angler_music/resources/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homePage extends StatefulWidget {
  final String? title;
  homePage({Key? key, this.title}) : super(key: key);

  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteNames.musicPlayer);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white),
        child: const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 100),
              child: Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF134FAF),
                    fontFamily: "Raleway",
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.play_circle_outline_rounded,
              color: Color(0xFF134FAF),
              size: 40,
            )
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Container(
      height: 80,
      width: 80,
      child: Image.asset(
        'assets/images/music_1.png',
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Colors.blueGrey,
              ],
            ),
            image: DecorationImage(
              image: new AssetImage("assets/images/music_player.jpg"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black,
                BlendMode.overlay,
              ),
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 130, top: 25, right: 50),
                child: Align(child: _title()),
              ),
              SizedBox(
                height: 380,
              ),
              Center(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'create your own playlist to accompany your day!!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontFamily: "Raleway",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _signUpButton(),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
