import 'package:flutter/cupertino.dart';

class CuponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path
      ..lineTo(0, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    final radius = size.height * .05;

    Path holePath = Path();

    for (int i = 1; i <= size.height * 0.5; i++) {
      holePath.addRect(
        Rect.fromCircle(
          center: Offset(0, (size.height * .05) * i),
          radius: 1,
        ),
      );
    }
    for (int i = 0; i <= size.height * 0.5; i++) {
      holePath.addOval(
        Rect.fromCircle(
          center: Offset(size.width, (size.height * .14) * i),
          radius: radius,
        ),
      );
    }

    return Path.combine(PathOperation.difference, path, holePath);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
