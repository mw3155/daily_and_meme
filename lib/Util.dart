import 'package:flutter/material.dart';
import 'dart:async';

import 'package:url_launcher/url_launcher.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

// global variables are fun
int nMeetingMinutes = 15;
List<String> meetingPersons = ["Sebastian", "Florian", "Markus", "Alex"];
String newMeetingPerson = "";

// timer
List<String> animationOptions = ["Luke v10", "Luke v2", "Stoppuhr"];
List<bool> selectedAnimation = [false, true, false];
int chosenAnimation = 1;
int currentSpeaker = 0;
Duration durationPerPerson = Duration(seconds: 1);
Duration durationExtraTime = Duration(seconds: 30);
bool isExtraTime = false;
bool isTimePaused = false;
double nMillisecondsPassedCurrentSpeaker = 0;

// robot timer
List<Duration> durationPicks = [Duration(seconds: 3), Duration(seconds: 30)];
List<String> robotAnimations = ["Animation-Success", "Animation-Dropped", "Animation-NoObject"];
Timer? dummyTimer;
// history 1 = successful pick else 0
List<List<int>> pickHistoryPerPerson = [];

// meme stuff
int memeCounter = 0;
bool isLanguageGerman = false;

// styling
final Color colorPaused = Colors.black;
final Color color1 = Color(0xff004489);
final Color color2 = Color(0xffF9B200);
final double myFontSizeScaleFactor = 34;
// gets calculated once in main.dart
double myResponsiveFontSize = 1;
const double defaultEdgeInsets = 16;

// bottomsheet
final String githubURL = "https://github.com/mw3155/DailyAndMeme";

Widget buildBottomSheet(BuildContext context) {
  return AnimatedContainer(
    duration: Duration(seconds: 1),
    color: isTimePaused ? colorPaused : Colors.blueGrey,
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
            resetGlobalVariables();
            navigatorKey.currentState?.pushNamed("/");
            Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
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

void resetGlobalVariables() {
  // global variables are fun
  nMeetingMinutes = 15;
  meetingPersons = ["Sebastian", "Florian", "Markus", "Alex"];
  newMeetingPerson = "";
  nMillisecondsPassedCurrentSpeaker = 0;
  dummyTimer?.cancel();
  chosenAnimation = 1;

  // timer
  currentSpeaker = 0;
  durationPerPerson = Duration(seconds: 1);
  durationExtraTime = Duration(seconds: 30);
  isExtraTime = false;
  isTimePaused = false;

  // meme stuff
  memeCounter = 0;
  isLanguageGerman = false;
}

int calculatePickAccuracyofPerson(String speaker) {
  int speakerIdx = meetingPersons.indexOf(speaker);

  // dummy value to prevent index oob
  if (speakerIdx == -1) return 100;

  if (speakerIdx >= pickHistoryPerPerson.length) return 0;
  // if persons was skipped
  if (pickHistoryPerPerson[speakerIdx].length == 0) return 0;

  // sum successful picks and div through number picks
  int nSuccessfull = pickHistoryPerPerson[speakerIdx].reduce((value, element) => value + element);
  return (nSuccessfull / pickHistoryPerPerson[speakerIdx].length * 100).round();
}

String calculatePickAccuracyofPersonAsString(String speaker) {
  return calculatePickAccuracyofPerson(speaker).toString() + "%";
}

int comparePersonsByPickAccuracy(String p1, String p2) {
  int pickAcc1 = calculatePickAccuracyofPerson(p1);
  int pickAcc2 = calculatePickAccuracyofPerson(p2);
  if (pickAcc1 > pickAcc2) return 1;
  return 0;
}
