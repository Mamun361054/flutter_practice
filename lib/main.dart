import 'package:flutter/material.dart';
import 'circular_progess_indicator/circular_progess_indicator.dart';
import 'instagram_gradient_animation/instagram_gradient_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CircularProgressIndicatorPainter(),
    );
  }
}

