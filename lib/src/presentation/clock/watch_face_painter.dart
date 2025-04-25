import 'dart:math';

import 'package:flutter/material.dart';

class WatchFacePainter extends CustomPainter {
  final DateTime dateTime;

  WatchFacePainter(this.dateTime);

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    // Paint for the outer circle
    final outerCirclePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Paint for the hour marks
    final hourMarkPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Paint for hour hand
    final hourHandPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;

    // Paint for minute hand
    final minuteHandPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Paint for center circle
    final centerDotPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Draw the outer circle
    canvas.drawCircle(center, radius - 4, outerCirclePaint);

    // Draw hour marks
    for (int i = 0; i < 12; i++) {
      final angle = i * (2 * pi / 12);
      final outerRadius = radius - 8;
      final innerRadius = radius - 16;

      final outerX = centerX + outerRadius * cos(angle);
      final outerY = centerY + outerRadius * sin(angle);
      final innerX = centerX + innerRadius * cos(angle);
      final innerY = centerY + innerRadius * sin(angle);

      canvas.drawLine(
        Offset(innerX, innerY),
        Offset(outerX, outerY),
        hourMarkPaint,
      );
    }

    // Draw minute marks
    for (int i = 0; i < 60; i++) {
      if (i % 5 != 0) {  // Skip positions where hour marks are
        final angle = i * (2 * pi / 60);
        final outerRadius = radius - 8;
        final innerRadius = radius - 12;

        final outerX = centerX + outerRadius * cos(angle);
        final outerY = centerY + outerRadius * sin(angle);
        final innerX = centerX + innerRadius * cos(angle);
        final innerY = centerY + innerRadius * sin(angle);

        canvas.drawLine(
          Offset(innerX, innerY),
          Offset(outerX, outerY),
          Paint()
            ..color = Colors.white.withOpacity(0.5)
            ..strokeWidth = 1,
        );
      }
    }

    // Hour hand
    final hourHandLength = radius * 0.5;
    final hourAngle = dateTime.hour * (2 * pi / 12) +
        dateTime.minute * (2 * pi / (12 * 60));
    final hourHandX = centerX + hourHandLength * sin(hourAngle);
    final hourHandY = centerY - hourHandLength * cos(hourAngle);
    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandPaint);

    // Minute hand
    final minuteHandLength = radius * 0.7;
    final minuteAngle = dateTime.minute * (2 * pi / 60) +
        dateTime.second * (2 * pi / (60 * 60));
    final minuteHandX = centerX + minuteHandLength * sin(minuteAngle);
    final minuteHandY = centerY - minuteHandLength * cos(minuteAngle);
    canvas.drawLine(center, Offset(minuteHandX, minuteHandY), minuteHandPaint);

    // Center dot
    canvas.drawCircle(center, 6, centerDotPaint);
  }

  @override
  bool shouldRepaint(WatchFacePainter oldDelegate) {
    return oldDelegate.dateTime != dateTime;
  }
}