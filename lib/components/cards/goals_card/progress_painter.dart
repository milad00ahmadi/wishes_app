import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as Math;

class ProgressPainter extends CustomPainter {
  ProgressPainter({@required this.color, @required this.completedPercentage});

  final Color color;
  final double completedPercentage;


  double degToRad(double deg) => deg * (Math.pi / 180.0);

  double percentageToDeg(double p) => (p * 360) / 100;

  double percentageToRad(double p) => degToRad(percentageToDeg(p));

  void addProgressArc(
    Canvas canvas,
    Size size,
    Paint paint,
    Path path,
  ) {
    path.addArc(
        Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2),
          radius: 28,
        ),
        -1.57,
        percentageToRad(this.completedPercentage));
      canvas.drawPath(path, paint);
    }


  void addProgressIndicator(Canvas canvas, Size size, Paint paint, Path path) {
    try {
      PathMetric metric = path.computeMetrics().first;
      final offset = metric.getTangentForOffset(0).position;
      path.addOval(Rect.fromCircle(radius: 2, center: offset));
      canvas.drawPath(path, paint);
    } catch (e) {}
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..color = this.color
      ..style = PaintingStyle.stroke;

    Path path = Path();
    this.addProgressArc(canvas, size, paint, path);
    this.addProgressIndicator(canvas, size, paint, path);
  }

  @override
  bool shouldRepaint(ProgressPainter oldDelegate) {
    return oldDelegate.completedPercentage != completedPercentage;
  }
}
