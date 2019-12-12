import 'package:flutter/material.dart';
import 'package:nasa_apod/widget/apod_pulse_animation.dart';

class APODLoaderAnimation extends StatefulWidget {

  final String planet;
  final bool error;

  APODLoaderAnimation({Key key, this.planet, this.error}): super(key: key);

  @override
  APODLoaderAnimationState createState() => APODLoaderAnimationState();
}

class APODLoaderAnimationState extends State<APODLoaderAnimation>
    with SingleTickerProviderStateMixin {

  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.stop();
    _controller.reset();
    _controller.repeat(
      period: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Center(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: CustomPaint(
                painter: PulseAnimation(_controller, widget.error),
                child: SizedBox(
                  width: 260.0,
                  height: 260.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                widget.planet,
                width: 68,
                height: 68.0,
                fit: BoxFit.fill,
              ),
            ),

          ],
        ),
      ),
    );
  }
}