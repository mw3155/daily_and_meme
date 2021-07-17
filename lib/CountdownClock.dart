import 'package:flutter/material.dart';

import 'Util.dart';

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
