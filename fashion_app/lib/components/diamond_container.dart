import 'package:flutter/material.dart';

class DiamondPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xffDD8560)
      ..style = PaintingStyle.fill;

    final double halfWidth = size.width / 2;
    final double halfHeight = size.height / 2;

    Path path = Path()
      ..moveTo(0, halfHeight)
      ..lineTo(halfWidth, 0)
      ..lineTo(size.width, halfHeight)
      ..lineTo(halfWidth, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
