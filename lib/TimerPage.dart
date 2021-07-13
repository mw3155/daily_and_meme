import 'dart:async';

import 'package:flutter/material.dart';
import 'RobotAnimation.dart';

import 'Util.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            color: isTimePaused ? colorPaused : Colors.blueGrey,
            padding: const EdgeInsets.all(32),
            child: _buildTimerPage(),
          ),
        ),
      ),
    );
  }

  late AnimationController _controller;
  late Timer dummyTimer;

  @override
  void initState() {
    super.initState();

    // HACK: create a timer to update a dummy value, to trigger rebuild of widget
    // -> updates the pick-count...lol...
    // TODO decreasing timer does not increase fps, right??
    // TODO decreasing timer does not increase fps, right??
    // TODO decreasing timer does not increase fps, right??
    dummyTimer = Timer.periodic(Duration(milliseconds: 1000), (Timer t) {
      setState(() {
        // TODO: nSeconds should not be increased while pausing; leads to animation jumps
        // why does this not work??
        // why does this not work??
        // why does this not work??
        // why does this not work??
        if (!isTimePaused) {
          nSecondsPassedCurrentSpeaker += 1;
          print(nSecondsPassedCurrentSpeaker);
        }
      });
    });

    _controller = AnimationController(
      vsync: this,
      duration: isExtraTime
          ? Duration(seconds: durationExtraTime.inSeconds)
          : Duration(seconds: durationPerPerson.inSeconds),
    );
    _controller.forward();
    isTimePaused = false;

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          isTimePaused = true;
          _showTimerFinishedDialog();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        } else if (status == AnimationStatus.forward) {
          print("hello");
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
    // BUG: before memepage, flutter builds a timerpage again with speaker > meetingPersons; idk why...
    String speakerName =
        meetingPersons.length <= currentSpeaker ? "null" : meetingPersons[currentSpeaker];

    double currentValueInSeconds = (1 - _controller.value) * _controller.duration!.inSeconds;
    int picksLeft = (currentValueInSeconds - 1) ~/ durationPick.inSeconds + 1;

    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        /*
        TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: screenWidth * 0.44),
            duration: Duration(seconds: 3),
            builder: (_, double i, __) {
              return Positioned(
                left: i,
                child: Text(
                  // comment out, maybe this tween stuff is useful later
                  //"$speakerName",
                  "",
                ),
              );
            }),
        */
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(32)),
            animationOptions[chosenAnimation] == "Robot"
                ? Text("Sprecher: \t$speakerName\nVerbleibende Picks: \t$picksLeft")
                : Padding(padding: EdgeInsets.all(0)),
            animationOptions[chosenAnimation] == "Robot"
                ? RobotAnimation()
                : Padding(padding: EdgeInsets.all(0)),
            animationOptions[chosenAnimation] == "Countdown"
                ? CountdownClock(
                    animation: CurvedAnimation(parent: _controller, curve: Curves.linear),
                    maxDuration: _controller.duration!,
                  )
                : Padding(padding: EdgeInsets.all(0)),
            Padding(padding: EdgeInsets.all(32)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (isTimePaused) {
                          isTimePaused = false;
                          _controller.forward();
                        } else {
                          isTimePaused = true;
                          _controller.stop();
                        }
                      });
                    },
                    child: Text(
                      isTimePaused ? "Fortsetzen" : "Pause",
                    )),
                ElevatedButton(
                  child: Text(
                    "Fertig",
                  ),
                  onPressed: () {
                    _goToNextSpeaker();
                  },
                ),
              ],
            )
          ],
        ),
      ],
    );
  }

  void _goToNextSpeaker() {
    isExtraTime = false;
    isTimePaused = false;
    currentSpeaker++;
    print(meetingPersons.length);
    print(currentSpeaker);
    currentSpeaker >= meetingPersons.length
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

// TODO make own file
class CountdownClock extends AnimatedWidget {
  // not sure what this key thing does, but "?" seems like a good fix
  CountdownClock({Key? key, required this.animation, required this.maxDuration})
      : super(key: key, listenable: animation);
  Animation<double> animation;
  Duration maxDuration;

  @override
  Widget build(BuildContext context) {
    double currentValueInSeconds = (1 - animation.value) * maxDuration.inSeconds;
    Duration currentDuration = Duration(seconds: currentValueInSeconds.toInt());

    double clockSize = MediaQuery.of(context).size.shortestSide * 0.6;

    String speakerName =
        meetingPersons.length <= currentSpeaker ? "null" : meetingPersons[currentSpeaker];

    return SizedBox(
      height: clockSize,
      child: Stack(
        children: [
          Center(
            child: Container(
              height: clockSize,
              width: clockSize,
              child: CircularProgressIndicator(
                // if animation is exactly 0, then drawArc fails
                value: (1 - animation.value) > 0.001 ? (1 - animation.value) : 0.001,
                strokeWidth: 10,
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: FractionalOffset.center,
              child: Text(
                  "$speakerName, \ndu hast noch\n${currentDuration.inMinutes} Min ${currentDuration.inSeconds.remainder(60)} Sek"),
            ),
          ),
        ],
      ),
    );
  }
}
