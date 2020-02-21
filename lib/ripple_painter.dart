import 'dart:math';

import 'package:flutter/material.dart';

class RipplePainter extends CustomPainter {
  final Animation<double> _animation;

  final Color _rippleColor;
  RipplePainter(this._animation,this._rippleColor) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 5.0)).clamp(0.0, 1.0);

    Color color = Color.fromRGBO(_rippleColor.red, _rippleColor.green, _rippleColor.blue, opacity);

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 5);

    final Paint paint = Paint();
    paint.color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = new Rect.fromLTRB(0.0, 0.0, size.width, size.height);

    for (int wave = 4; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(RipplePainter ripplePainter) {
    return true;
  }
}
