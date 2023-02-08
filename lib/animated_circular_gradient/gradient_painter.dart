import 'package:flutter/cupertino.dart';

class GradientPainter extends CustomPainter {
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  GradientPainter(
      {required this.radius,
      required this.strokeWidth,
      required this.gradient});

  @override
  void paint(Canvas canvas, Size size) {
    final painter = Paint();
    final centerPointOffset = Offset(size.width / 2, size.height / 2);
    final rect = Rect.fromCircle(center: centerPointOffset, radius: radius);

    painter
      ..shader = gradient.createShader(rect)
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(centerPointOffset, radius, painter);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
