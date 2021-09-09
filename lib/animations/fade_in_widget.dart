import 'package:flutter/cupertino.dart';

class FadeInWidget extends StatefulWidget {
  const FadeInWidget({Key? key, required this.child});

  final Widget child;

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
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
          child: Transform(
            transform: Matrix4.identity()
              ..translate(0.0, _calcPosition(_animationController.value))
              ..rotateZ(_calcAngle(_animationController.value)),
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

  double _calcAngle(double animationValue) {
    return (1 - animationValue) / 180;
  }
}
