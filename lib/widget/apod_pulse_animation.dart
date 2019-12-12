import 'dart:math';
import 'package:flutter/material.dart';

class PulseAnimation extends CustomPainter {
  final Animation<double> _animation;
  final bool _error;

  PulseAnimation(this._animation, this._error) : super(repaint: _animation);

  void circle(Canvas canvas, Rect rect, double value) {
    double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    Color color = _error ? Color.fromRGBO(222, 99, 99, opacity) : Color.fromRGBO(0, 117, 194, opacity);;

    double size = rect.width / 2;
    double area = size * size;
    double radius = sqrt(area * value / 4);

    final Paint paint = Paint()..color = color;
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 4; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(PulseAnimation oldDelegate) {
    return true;
  }
}

