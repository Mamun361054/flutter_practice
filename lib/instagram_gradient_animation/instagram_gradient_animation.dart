import 'dart:async';
import 'package:flutter/material.dart';

class InstagramGradientAnim extends StatefulWidget {
  const InstagramGradientAnim({Key? key}) : super(key: key);

  @override
  State<InstagramGradientAnim> createState() => _InstagramGradientAnimState();
}

int count = 0;

class _InstagramGradientAnimState extends State<InstagramGradientAnim> {
  _startBgColorAnimationTimer() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      count++;
      setState(() {});
    });
    const interval = Duration(seconds: 5);

    Timer.periodic(interval, (timer) {
      count++;
      setState(() {});
    });
  }

  @override
  void initState() {
    _startBgColorAnimationTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedContainer(duration: const Duration(seconds: 2),
          width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: getColorList,
                begin: getAlignments[count % getAlignments.length],
                end: getAlignments[(count + 2) % getAlignments.length],
                 tileMode: TileMode.clamp
              )
            ),
          ),
          Container(height: MediaQuery.of(context).size.height),
        ],
      ),
    );
  }
}

///Generate list of random colors which will be used to show
///different gradients in the background
List<Color> get getColorList => [
      Colors.red,
      Colors.purpleAccent,
      Colors.yellow,
      Colors.deepPurple
    ]..shuffle();

///Generate list of random alignments which will be used to show
///different position like from start to end for random color
List<Alignment> get getAlignments => [
      Alignment.bottomLeft,
      Alignment.bottomRight,
      Alignment.topRight,
      Alignment.topLeft
    ];
