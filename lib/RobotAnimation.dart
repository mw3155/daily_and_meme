import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RobotAnimation extends StatefulWidget {
  const RobotAnimation({Key? key}) : super(key: key);

  @override
  _RobotAnimationState createState() => _RobotAnimationState();
}

class _RobotAnimationState extends State<RobotAnimation> {
  void _togglePlay() {
    if (_controller == null) {
      return;
    }
    setState(() {
      _controller!.isActive = !_controller!.isActive;
    });
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard? _riveArtboard;
  RiveAnimationController? _controller;
  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
//          RiveAnimation.asset( "animations/animation-robot1.riv",
    rootBundle.load('assets/animations/animation-robot1.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard.instance();
        // Add a controller to play back a known animation on the main/default
        // artboard. We store a reference to it so we can toggle playback.
        artboard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() {
          _riveArtboard = artboard;
          _riveArtboard!.instance().animationByName("Animation 1")!.animation.speed = 0.05;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double robotSize = MediaQuery.of(context).size.shortestSide * 0.6;
    return Column(
      children: [
        SizedBox(
          width: robotSize,
          height: robotSize,
          child: Center(
            child: _riveArtboard == null
                ? const SizedBox()
                : Rive(
                    artboard: _riveArtboard!,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ],
    );
  }
}
