import 'package:flutter/material.dart';

import 'gradient_painter.dart';

class CircularGradientScreen extends StatefulWidget {
  const CircularGradientScreen({Key? key}) : super(key: key);

  @override
  State<CircularGradientScreen> createState() => _CircularGradientScreenState();
}

class _CircularGradientScreenState extends State<CircularGradientScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    animation = Tween<double>(begin: 0.0, end: 4.0).animate(controller);
    controller
      ..forward()
      ..repeat(reverse: false);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Stack(
            alignment: Alignment.center,
            children: [
              RotationTransition(
                turns: animation,
                child: CustomPaint(
                  painter: GradientPainter(
                      radius: 50.0,
                      strokeWidth: 4,
                      gradient: const LinearGradient(
                          colors: [Colors.yellow, Colors.red, Colors.green])),
                ),
              ),
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const ShapeDecoration(shape: CircleBorder(),color: Colors.white),
                height: 95.0,
                width: 95.0,
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/dash.png',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
