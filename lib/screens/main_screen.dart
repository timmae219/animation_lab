import 'package:animation_lab/animations/fade_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInWidget(
          child: Text(
            '!', style: TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }
}
