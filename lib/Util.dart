import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

// global variables are fun
int nMeetingMinutes = 15;
List<String> meetingPersons = ["Sebastian", "Florian", "Markus", "Thomas", "Alex"];
String newMeetingPerson = "";

// timer
int currentSpeaker = 0;
Duration durationPerPerson = Duration(seconds: 1);
Duration durationExtraTime = Duration(seconds: 30);
bool isExtraTime = false;
Color colorPaused = Colors.black;
bool isTimeStopped = false;

// styling
Color color1 = Color(0xff004489);
Color color2 = Color(0xffF9B200);
// gets overwritten by mediaquery
double myFontSizeScaleFactor = 30;

// meme stuff
int memeCounter = 0;
bool isLanguageGerman = false;

// bottomsheet
String githubURL = "https://github.com/mw3155/DailyAndMeme";

Widget buildBottomSheet() {
  return AnimatedContainer(
    duration: Duration(seconds: 1),
    color: isTimeStopped ? colorPaused : Colors.blueGrey,
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          color: Colors.black,
          tooltip: "Zebra",
          icon: Icon(Icons.audiotrack),
          iconSize: 32,
          onPressed: () {
            navigatorKey.currentState?.pushNamed("zebra");
          },
        ),
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.home),
          tooltip: "Zur Startseite",
          iconSize: 32,
          onPressed: () {
            // TODO reset global vars
            navigatorKey.currentState?.pushNamed("/");
          },
        ),
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.pest_control),
          tooltip: "Github",
          iconSize: 32,
          onPressed: () async {
            await canLaunch(githubURL)
                ? await launch(githubURL)
                : throw 'Could not launch $githubURL';
          },
        ),
      ],
    ),
  );
}
