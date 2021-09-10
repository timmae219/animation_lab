import 'package:animation_lab/animations/fade_in_widget.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math' as Math;
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Key columnKey = GlobalKey();

    return Scaffold(
      body: Center(
        child: Column(
          key: columnKey,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  '360 Grad-Drehung',
                ),
              ),
              rotating: true,
            ),
            FadeInWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Schub nach oben',
                ),
              ),
            ),
            FadeInWidget(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Opacity-Animation',
                ),
              ),
              rotating: true,
            ),
          ],
        ),
      ),
    );
  }
}
