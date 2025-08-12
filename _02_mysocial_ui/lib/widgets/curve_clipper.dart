import 'package:flutter/material.dart';

//clipper tak perlu responseive
//SUMBER BACAAN :https://medium.com/flutter-community/flutter-custom-clipper-28c6d380fdd6
class CurveClipper extends CustomClipper<Path> {
  //tambahkan misisng ovveridenya

  @override
  Path getClip(Size size) {
    Path path = Path();
    //tiggi image dibagi 5 utk buat busur
    //titik y0.0 -->y0.sizeheigh/5
    path.lineTo(
      0,
      4 * size.height / 5,
    ); //titk terendah sblak kiri dari titik-max-busur
    //titik-max-busur ,line width dibagi 4

    Offset curvePoint1 = Offset(
      size.width / 4,
      size.height,
    ); //max-titik-busur(kebawah)

    //titik tengah body ( tinggi sama  yaitu   4 * size.height / 5 )
    Offset centerPoint = Offset(
      size.width / 2,
      4 * size.height / 5,
    ); //titk terendah sblak kanan dari titik-max-busur
    path.quadraticBezierTo(
      curvePoint1.dx,
      curvePoint1.dy,
      centerPoint.dx,
      centerPoint.dy,
    );
    //mmbuat kurve sisa dari tengah ke kanan
    //ini nilai y mejorok ke dalam ( -minus paling tinggi =3 * size.height / 5)
    Offset curvePoint2 = Offset(3 * size.width / 4, 3 * size.height / 5);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint2.dx,
      curvePoint2.dy,
      endPoint.dx,
      endPoint.dy,
    );

    //tutup sisi atas tengah ke kanan (luasan width)
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

/*
ada 6 point yg dibuat 
titl ujung kiri atas 0.0_
kebawah tegak lurus (a)
titik mask parabola bawah dari (a) kekanan (b) 
titik dari max parabola ke (c) 
titik dari c ke min-max d 
titika dari min-max d ke ujung kanan bawah 



*/
