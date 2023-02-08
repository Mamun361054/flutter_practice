import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' as vmath;

class CircularProgressIndicatorPainter extends StatelessWidget {
  const CircularProgressIndicatorPainter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: CustomPaint(
            painter: ProgressPainter(),
            child: const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    ///get the center of the canvas
    final center = Offset(size.width / 2, size.height / 2);

    ///Draw the grey background seen on the progress indicator
    ///this will act as the background layer
    canvas.drawCircle(
        center,
        85.0,
        Paint()
          ..style = PaintingStyle.stroke
          ..color = Colors.black12
          ..strokeWidth = 30.0);

    ///Draw a new layer where we will be painting the
    ///actual progress indicator
    canvas.saveLayer(
        Rect.fromCenter(center: center, width: 200, height: 200), Paint());

    ///draw the light green portion of the progress indicator
    canvas.drawArc(
        Rect.fromCenter(center: center, width: 170.0, height: 170.0),
        vmath.radians(0),
        vmath.radians(200),
        false,
        Paint()..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round
        ..color = Colors.green.shade100
        ..strokeWidth = 30.0
    );

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
