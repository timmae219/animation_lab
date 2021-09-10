import 'dart:math' as Math;
import 'package:flutter/cupertino.dart';

class FadeInWidget extends StatefulWidget {
  const FadeInWidget({
    Key? key,
    required this.child,
    this.rotating = false,
  });

  final Widget child;
  final bool rotating;

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  double lastRad = 0.0;
  double maxRotation = 180;
  double sumAngle = 0.0;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset.zero,
          child: widget.rotating
              ? Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, _calcPosition(_animationController.value))
                    ..rotateZ(_calcAngle(_animationController.value)),
                  child: widget.child,
                )
              : Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, _calcPosition(_animationController.value)),
                  child: widget.child,
                ),
        );
      },
      animation: _animationController,
    );
  }

  double _calcPosition(double animationValue) {
    return 360 - (360 * animationValue);
  }

  // rotateZ needs rad values not degree
  // we need the difference of the angle, between where we want to be in the current animation step (0 - 1)
  // and where we were in the previous step
  _calcAngle(double animationValue) {
    var degree = animationValue * maxRotation;
    const MAGIC_FACTOR = 1.9995; // FIXME why this needed?
    var degreeToRadFactor = Math.pi * MAGIC_FACTOR / 180;
    var newRad = degree * degreeToRadFactor;
    var returnRad = newRad - lastRad;
    lastRad = returnRad;
    sumAngle += returnRad;
    return Math.pi - returnRad;
  }
}
