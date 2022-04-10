import 'dart:async';

import 'package:flutter/material.dart';
import 'RobotAnimation.dart';
import 'CountdownClock.dart';

import 'package:animated_background/animated_background.dart';
import 'RainParticleBehaviour.dart';

import 'Util.dart';

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // disable going back
      onWillPop: () => Future.value(false),
      child: Scaffold(
        bottomSheet: buildBottomSheet(context),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            color: isTimePaused ? colorPaused : Colors.blueGrey,
            padding: const EdgeInsets.all(32),
            child: AnimatedBackground(
              behaviour: RainParticleBehaviour(options: particleOptions),
              vsync: this,
              child: _buildTimerPage(),
            ),
          ),
        ),
      ),
    );
  }

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // HACK: create a timer to update a dummy value, to trigger rebuild of widget
    // -> updates the pick-count...lol...
    // TODO does decreasing timer increase fps?
    dummyTimer = Timer.periodic(Duration(milliseconds: 100), (Timer t) {
      setState(() {
        // nSeconds should not be increased while pausing; leads to animation jumps
        if (!isTimePaused) {
          nMillisecondsPassedCurrentSpeaker += 100;
        }
        //if (nMillisecondsPassedCurrentSpeaker % 1000 == 0) print(nMillisecondsPassedCurrentSpeaker);
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
    int picksLeft = 0;
    if (animationOptions[chosenAnimation].contains("Luke"))
      picksLeft = (currentValueInSeconds - 1) ~/ durationPicks[chosenAnimation].inSeconds + 1;

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.all(32)),
            animationOptions[chosenAnimation].contains("Luke")
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Sprecher:"),
                            Text(speakerName),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Verbleibende Picks:"),
                            Text(picksLeft.toString()),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Pickgüte:"),
                            Text(
                              calculatePickAccuracyofPersonAsString(
                                  currentSpeaker >= meetingPersons.length // prevent index oob
                                      ? ""
                                      : meetingPersons[currentSpeaker]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Padding(padding: EdgeInsets.all(0)),
            animationOptions[chosenAnimation].contains("Luke")
                ? RobotAnimation()
                : Padding(padding: EdgeInsets.all(0)),
            animationOptions[chosenAnimation] == "Stoppuhr"
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
    // TODO: maybe need to add last animation to history here
    currentAnimationIdx = -1;
    nMillisecondsPassedCurrentSpeaker = 0;
    dummyTimer!.cancel();
    currentSpeaker++;
    print(meetingPersons.length);
    print(currentSpeaker);
    currentSpeaker >= meetingPersons.length
        ? Navigator.pushNamed(context, "scoreboard")
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
                  dummyTimer!.cancel();
                  nMillisecondsPassedCurrentSpeaker = 0;
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
