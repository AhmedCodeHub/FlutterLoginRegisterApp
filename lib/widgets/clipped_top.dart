


import 'package:flutter/material.dart';

class ClippedTop  extends CustomClipper<Path>{
  @override

  Path getClip(Size size) {

    var path = Path();
    
    path.lineTo(0, size.height-35);

    var ctrlPt = Offset(size.width/6, size.height - 70);
    var endPt = Offset(((size.width/2)), size.height - 35);
    path.quadraticBezierTo(ctrlPt.dx, ctrlPt.dy, endPt.dx, endPt.dy);

    var ctrlPt2 = Offset(((size.width*3/4)), size.height);
    var endPt2 = Offset(((size.width)), size.height - 35);
    path.quadraticBezierTo(ctrlPt2.dx, ctrlPt2.dy, endPt2.dx, endPt2.dy);

    path.lineTo(size.width, 0);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}