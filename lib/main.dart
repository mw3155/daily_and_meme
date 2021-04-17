/// Flutter code sample for CircularProgressIndicator

// This example shows a [CircularProgressIndicator] with a changing value.

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    //controller.repeat(reverse: true);
    controller.forward();
    controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(controller.value);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Linear progress indicator with a fixed color',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(
              height: 300,
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      child: CircularProgressIndicator(
                        value: controller.value,
                        strokeWidth: 10,
                        semanticsLabel: 'Linear progress indicator',
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      alignment: FractionalOffset.center,
                      child: Text("hi"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:google_fonts/google_fonts.dart';

/*
TODO:
- zebra button
- deutsche memes
- timer animation
- ads
- hiring
- donations
- proversion
*/

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Daily and Meme',
      theme: ThemeData(
        backgroundColor: Colors.amber,
        scaffoldBackgroundColor: Colors.blueGrey,
        bottomAppBarColor: Colors.amber,
        dialogBackgroundColor: Colors.blueGrey,
        primarySwatch: Colors.blueGrey,
        textTheme: GoogleFonts.robotoMonoTextTheme(textTheme).copyWith(
          bodyText1: GoogleFonts.robotoMono(fontSize: myFontSizeMed),
          bodyText2: GoogleFonts.robotoMono(fontSize: myFontSizeMed),
          caption: GoogleFonts.robotoMono(fontSize: myFontSizeMed),
          button: GoogleFonts.robotoMono(fontSize: myFontSizeMed),
          headline6: GoogleFonts.robotoMono(fontSize: myFontSizeMed),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.amber),
        ),
        // primaryColor only for appbar on smartphone?
        primaryColor: Colors.blueGrey,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => CircularProgress(),
        "timer": (context) => TimerPage(),
        "meme": (context) => MemePage(),
        "work": (context) => WorkPage(),
        "zebra": (context) => ZebraPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// global variables are fun
int nMeetingMinutes = 15;
int nMeetingPersons = 5;
Duration durationPerPerson = Duration(seconds: 1);
int currentSpeaker = 0;
bool isTimeStopped = false;
Duration durationExtraTime = Duration(seconds: 30);
bool isExtraTime = false;
int memeCounter = 0;
// styling
Color color1 = Color(0xff004489);
Color color2 = Color(0xffF9B200);
double myFontSizeMed = 32;
double myFontSizeSmall = 16;

Widget buildBottomSheet() {
  return Container(
    color: Colors.blueGrey,
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
      ],
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: buildBottomSheet(),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32),
          child: _buildHomepage(),
        ),
      ),
    );
  }

  Widget _buildHomepage() {
    return Column(
      children: [
        Text("Wie viele Personen nehmen teil?"),
        NumberPicker(
            selectedTextStyle:
                TextStyle(fontSize: myFontSizeMed, color: Colors.amber),
            value: nMeetingPersons,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) =>
                setState(() => nMeetingPersons = newValue)),
        Text("Wie viele Minuten sind insgesamt eingeplant?"),
        NumberPicker(
            selectedTextStyle:
                TextStyle(fontSize: myFontSizeMed, color: Colors.amber),
            value: nMeetingMinutes,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) =>
                setState(() => nMeetingMinutes = newValue)),
        Padding(
          child: ElevatedButton(
            onPressed: () {
              int nSecondsPerPerson = nMeetingMinutes * 60 ~/ nMeetingPersons;
              durationPerPerson = Duration(seconds: nSecondsPerPerson);
              _showConfirmDialog();
            },
            child: Text(
              "Meeting starten",
            ),
          ),
          padding: EdgeInsets.all(32),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Future<void> _showConfirmDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
              'Es gibt $nMeetingPersons Teilnehmer\nJeder hat eine Redezeit von ${durationPerPerson.inMinutes} Minuten und ${durationPerPerson.inSeconds.remainder(60)} Sekunden.'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(padding: EdgeInsets.all(8)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text("Abbrechen")),
                  ElevatedButton(
                      child: Text('Starten'),
                      onPressed: () {
                        currentSpeaker = 1;
                        Navigator.pushNamed(context, "timer");
                      }),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  void updateIsSelectedList(int index, List<bool> isSelected) {
    setState(
      () {
        for (int buttonIndex = 0;
            buttonIndex < isSelected.length;
            buttonIndex++) {
          if (buttonIndex == index) {
            isSelected[buttonIndex] = true;
          } else {
            isSelected[buttonIndex] = false;
          }
        }
      },
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: _buildTimerPage(),
          ),
        ),
      ),
    );
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: isExtraTime
          ? Duration(seconds: durationExtraTime.inSeconds)
          : Duration(seconds: durationPerPerson.inSeconds),
    );
    _controller.forward();

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _showTimerFinishedDialog();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildTimerPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Person $currentSpeaker",
        ),
        Padding(padding: EdgeInsets.all(32)),
        Countdown(
          animation: StepTween(begin: _controller.duration!.inSeconds, end: 0)
              .animate(_controller),
        ),
        Padding(padding: EdgeInsets.all(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isTimeStopped) {
                      isTimeStopped = false;
                      _controller.forward();
                    } else {
                      isTimeStopped = true;
                      _controller.stop();
                    }
                  });
                },
                child: Text(
                  isTimeStopped ? "Fortsetzen" : "Pause",
                )),
            ElevatedButton(
              child: Text(
                "Fertig",
              ),
              onPressed: () => _goToNextSpeaker(),
            ),
          ],
        )
      ],
    );
  }

  void _goToNextSpeaker() {
    isExtraTime = false;
    currentSpeaker++;
    currentSpeaker > nMeetingPersons
        ? Navigator.pushNamed(context, "meme")
        : Navigator.pushNamed(context, "timer");
  }

  Future<void> _showTimerFinishedDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Deine Zeit ist abgelaufen',
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                  "+30 Sekunden",
                ),
                onPressed: () {
                  isExtraTime = true;
                  Navigator.pushNamed(context, "timer");
                },
              ),
              ElevatedButton(
                child: Text(
                  "Fertig",
                ),
                onPressed: () => _goToNextSpeaker(),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Countdown extends AnimatedWidget {
  // not sure what this key thing does, but "?" seems like a good fix
  Countdown({Key? key, required this.animation})
      : super(key: key, listenable: animation);
  Animation<int> animation;

  @override
  Widget build(BuildContext context) {
    int timerText = animation.value;
    Duration currentDuration = Duration(seconds: timerText);
    return Text(
      "Du hast noch ${currentDuration.inMinutes} Minuten und ${currentDuration.inSeconds.remainder(60)} Sekunden",
    );
  }
}

class MemePage extends StatefulWidget {
  @override
  _MemePageState createState() => _MemePageState();
}

class _MemePageState extends State<MemePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        body: Center(
          child: Container(
            height: 1080,
            width: 1280,
            padding: const EdgeInsets.all(32),
            child: _buildMemePage(),
          ),
        ),
      ),
    );
  }

  String currentMemeTitle = "";
  String currentMemeImage = "";

  Widget _buildMemePage() {
    if (memeCounter == 0) getNextMeme();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(currentMemeTitle),
        memeCounter == 0
            ? Icon(Icons.photo)
            : Image.network(
                currentMemeImage,
                //height: 600,
                height: MediaQuery.of(context).size.height -
                    (32 +
                        myFontSizeMed +
                        0 +
                        16 +
                        myFontSizeMed +
                        32 +
                        8 +
                        32 +
                        8 +
                        50),
                // memetitle + padding to buttons + ... + 50 (magic number..)
                fit: BoxFit.contain,
              ),
        Padding(padding: EdgeInsets.all(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "work"),
              child: Text(
                "Ran an die Arbeit!",
              ),
            ),
            ElevatedButton(
              onPressed: () {
                getNextMeme();
              },
              child: Text(
                "Noch ein Meme!",
              ),
            ),
          ],
        )
      ],
    );
  }

  void getNextMeme() async {
    // get json from programmerhumor and decode it
    String memeSite = "www.reddit.com";
    String memeSiteEnding = "/r/ProgrammerHumor/top.json";
    final response = await http.get(Uri.https(memeSite, memeSiteEnding));

    Map<String, dynamic> memeJson = jsonDecode(response.body);

    while (true) {
      memeCounter++;
      bool isVideo =
          memeJson["data"]["children"][memeCounter]["data"]["is_video"];
      if (!isVideo) break;
    }

    setState(() {
      currentMemeTitle =
          memeJson["data"]["children"][memeCounter]["data"]["title"];
      currentMemeImage =
          memeJson["data"]["children"][memeCounter]["data"]["url"];
    });

    print(currentMemeImage);
  }
}

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: _buildWorkPage(),
          ),
        ),
      ),
    );
  }

  Widget _buildWorkPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://media.giphy.com/media/jkSvCVEXWlOla/source.gif",
          width: 1280,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

class ZebraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(32),
            child: _buildZebraPage(),
          ),
        ),
      ),
    );
  }

  Widget _buildZebraPage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://media.giphy.com/media/10hO3rDNqqg2Xe/giphy.gif",
          width: 1280,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class CircularProgress extends StatefulWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  _CircularProgressState createState() => _CircularProgressState();
}

/// This is the private State class that goes with CircularProgress.
/// AnimationControllers can be created with `vsync: this` because of TickerProviderStateMixin.
class _CircularProgressState extends State<CircularProgress>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              'Linear progress indicator with a fixed color',
              style: Theme.of(context).textTheme.headline6,
            ),
            CircularProgressIndicator(
              value: controller.value,
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    );
  }
}

*/
