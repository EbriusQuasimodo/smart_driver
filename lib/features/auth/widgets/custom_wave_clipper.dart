import 'package:flutter/material.dart';

class CustomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path
      ..lineTo(0, size.height / 2)
      ..cubicTo(size.width / 4, 3 * (size.height / 2), 3 * (size.width / 4),
          size.height / 2, size.width, size.height * 0.9)
      ..lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
