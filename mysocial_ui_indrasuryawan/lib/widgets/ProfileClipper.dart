import 'package:flutter/material.dart';

//SUMBER BACAAB: https://medium.com/flutter-community/flutter-custom-clipper-28c6d380fdd6
class ProfileClipper extends CustomClipper<Path> {
  //otomatis buat 2 overides dari method CustomClipper!

  @override
  Path getClip(Size size) {
    //declare field path type dari class Path
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curvePoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      //x1
      curvePoint.dx,

      //y1
      curvePoint.dy,
      //x2
      endPoint.dx,
      //y2
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
