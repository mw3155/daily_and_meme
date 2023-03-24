import 'package:flutter/material.dart';
import 'dart:async';

import 'package:animated_background/animated_background.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

const int defaultMeetingMinutes = 15;
const List<String> defaultMeetingPersons = [
  "Sebastian",
  "Florian",
  "Markus",
  "Alex"
];
const int defaultChosenAnimation = 1;

const String prefKeyNMinutes = "n_meeting_minutes";
const String prefkeyMeetingPersons = "meeting_persons";
const String prefKeyChosenAnimation = "chosen_animation";

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

// global variables are fun
int nMeetingMinutes = 15;
List<String> meetingPersons = [
  "Sebastian",
  "Florian",
  "Markus",
  "Alex",
  "Thomas",
  "Yannick",
  "Ralf"
];
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
List<String> robotAnimations = [
  "Animation-Success",
  "Animation-Success-Double",
  "Animation-Success-Drop-High",
  "Animation-Success-Throw",
  "Animation-Dropped",
  "Animation-NoObject"
];
int currentAnimationIdx = -1;
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
final String buymeacoffeeURL = "https://www.buymeacoffee.com/mw3155";

// Snowparticle
ParticleOptions particleOptions = ParticleOptions(
  image: Image.asset('assets/images/snowflake-koch-iter7.png'),
  baseColor: Colors.blue,
  spawnOpacity: 0.0,
  opacityChangeRate: 0.15,
  minOpacity: 0.1,
  maxOpacity: 0.4,
  spawnMinSpeed: 30.0,
  spawnMaxSpeed: 100.0,
  spawnMinRadius: 7.0,
  spawnMaxRadius: 25.0,
  particleCount: 80,
);

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
          icon: Icon(Icons.home),
          tooltip: "Zur Startseite",
          iconSize: 32,
          onPressed: () async {
            await resetGlobalVariablesAsync();
            navigatorKey.currentState?.pushNamed("/");
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
          },
        ),
        IconButton(
          color: Colors.black,
          icon: Icon(Icons.coffee),
          tooltip: "Buy me a coffee :)",
          iconSize: 32,
          onPressed: () async {
            await canLaunch(buymeacoffeeURL)
                ? await launch(buymeacoffeeURL)
                : throw 'Could not launch $buymeacoffeeURL';
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
          tooltip: "It's Chuck Time",
          icon: Image.asset('assets/images/icons8-chuck-norris-100.png'),
          iconSize: 32,
          onPressed: () {
            navigatorKey.currentState?.pushNamed("chucknorris");
          },
        ),
        IconButton(
          color: Colors.black,
          tooltip: "It's Quiz Time",
          icon: Icon(Icons.question_mark),
          iconSize: 32,
          onPressed: () {
            navigatorKey.currentState?.pushNamed("quizpage");
          },
        ),
      ],
    ),
  );
}

Future<void> resetGlobalVariablesAsync() async {
  // Try to get cached settings
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefInstance = await SharedPreferences.getInstance();

  nMeetingMinutes =
      prefInstance.getInt(prefKeyNMinutes) ?? defaultMeetingMinutes;
  meetingPersons = prefInstance.getStringList(prefkeyMeetingPersons) ??
      [...defaultMeetingPersons];
  chosenAnimation =
      prefInstance.getInt(prefKeyChosenAnimation) ?? defaultChosenAnimation;

  // global variables are fun
  newMeetingPerson = "";
  nMillisecondsPassedCurrentSpeaker = 0;
  dummyTimer?.cancel();

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
  int nSuccessfull = pickHistoryPerPerson[speakerIdx]
      .reduce((value, element) => value + element);
  return (nSuccessfull / pickHistoryPerPerson[speakerIdx].length * 100).round();
}

Future<void> saveSettingsAsync() async {
  // Save settings to cache
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefInstance = await SharedPreferences.getInstance();

  prefInstance.setInt(prefKeyNMinutes, nMeetingMinutes);
  prefInstance.setStringList(prefkeyMeetingPersons, meetingPersons);
  prefInstance.setInt(prefKeyChosenAnimation, chosenAnimation);
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
