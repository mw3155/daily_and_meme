import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

//TODO: memes

void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      title: 'Daily and Meme',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(primary: Colors.amber),
        ),
        // color is useless?
        primaryColor: Colors.pink,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => HomePage(),
        "timer": (context) => TimerPage(),
        "meme": (context) => MemePage(),
        "work": (context) => WorkPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

// fun global variables
int nMeetingMinutes = 15;
int nMeetingPersons = 5;
Duration durationPerPerson = Duration(seconds: 1);
int currentSpeaker = 0;
bool isTimeStopped = false;
Duration durationExtraTime = Duration(seconds: 30);
bool isExtraTime = false;
// styling
Color color1 = Color(0xff004489);
Color color2 = Color(0xffF9B200);
double myFontSizeMed = 32;
double myFontSizeSmall = 16;

Widget buildBottomSheet() {
  return Container(
    padding: EdgeInsets.all(32),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.home),
          tooltip: "Zur Startseite",
          iconSize: 32,
          onPressed: () {
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
        Text("Wie viele Personen nehmen teil?",
            style: TextStyle(fontSize: myFontSizeMed)),
        NumberPicker(
            value: nMeetingPersons,
            minValue: 1,
            maxValue: 100,
            step: 1,
            haptics: true,
            axis: Axis.horizontal,
            onChanged: (newValue) =>
                setState(() => nMeetingPersons = newValue)),
        Text("Wie viele Minuten sind insgesamt eingeplant?",
            style: TextStyle(fontSize: myFontSizeMed)),
        NumberPicker(
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
              style: TextStyle(fontSize: myFontSizeMed),
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
          style: TextStyle(fontSize: myFontSizeMed),
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
                  style: TextStyle(fontSize: myFontSizeMed),
                )),
            ElevatedButton(
              child: Text(
                "Fertig",
                style: TextStyle(fontSize: myFontSizeMed),
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
                  style: TextStyle(fontSize: myFontSizeSmall),
                ),
                onPressed: () {
                  isExtraTime = true;
                  Navigator.pushNamed(context, "timer");
                },
              ),
              ElevatedButton(
                child: Text(
                  "Fertig",
                  style: TextStyle(fontSize: myFontSizeSmall),
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
      style: TextStyle(fontSize: myFontSizeMed),
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
            padding: const EdgeInsets.all(32),
            child: _buildMemePage(),
          ),
        ),
      ),
    );
  }

  Widget _buildMemePage() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://upload.wikimedia.org/wikipedia/en/5/5f/Original_Doge_meme.jpg",
          width: 1280,
          fit: BoxFit.fill,
        ),
        Padding(padding: EdgeInsets.all(32)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, "work"),
              child: Text(
                "Ran an die Arbeit!",
                style: TextStyle(fontSize: myFontSizeMed),
              ),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text(
                "Noch ein Meme!",
                style: TextStyle(fontSize: myFontSizeMed),
              ),
            ),
          ],
        )
      ],
    );
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
