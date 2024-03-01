import 'package:flutter/material.dart';

class WavePainter extends CustomPainter {
  WavePainter({
    required this.radius,
  });

  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(colors: [
        Colors.lightGreenAccent,
        Colors.green,
      ]).createShader(Offset.zero & size);

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height - 2 * radius)
      ..arcToPoint(
        Offset(radius, size.height - radius),
        radius: Radius.circular(radius),
        clockwise: false,
      )
      ..lineTo(size.width - radius, size.height - radius)
      ..arcToPoint(
        Offset(size.width, size.height),
        radius: Radius.circular(radius),
      )
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
