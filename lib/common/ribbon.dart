import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class RibbonView extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var paint1 = Paint();
    paint1.color = Colors.amber;
    paint1.style = PaintingStyle.fill;
    paint1.strokeWidth = 2.0;

    var path = Path();
    var path1 = Path();

    //path.moveTo(0, size.height * 0.9167);
    //path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
    //  size.width * 0.5, size.height * 0.9167);
    //path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
    //  size.width * 1.0, size.height * 0.9167);
    // path.lineTo(size.width, size.height);
    // path.lineTo(0, size.height);

    // path1.lineTo(size.width, size.width);
    // path1.lineTo(size.width, size.height);
    //path1.lineTo(size.width, size.height);

    //canvas.drawPath(path, paint);
    //canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
