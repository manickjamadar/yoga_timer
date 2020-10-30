import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yogatimer/widgets/progress.dart';

class Circle extends StatelessWidget {
  final Progress progress;
  final double strokeWidth;
  final double radius;
  final List<Color> colors;
  const Circle(
      {Key key,
      @required this.progress,
      this.strokeWidth = 12,
      this.radius = 100,
      this.colors = const [Colors.red, Colors.orange]})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: CustomPaint(
            painter: CirclePainter(
                progress: progress, strokeWidth: strokeWidth, colors: colors),
            size: Size(radius * 2, radius * 2)));
  }
}

class CirclePainter extends CustomPainter {
  final double strokeWidth;
  final Progress progress;
  final List<Color> colors;
  CirclePainter(
      {@required this.strokeWidth,
      @required this.progress,
      @required this.colors});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint
      ..style = PaintingStyle.stroke
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final double startAngle = -pi / 2;
    final double sweepAngle = 2 * pi * progress.value;
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2 - strokeWidth / 2);
    final gradient = LinearGradient(
        colors: colors == null || colors.isEmpty
            ? [Colors.black, Colors.black]
            : colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
    paint..shader = gradient.createShader(rect);
    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;

  @override
  bool shouldRebuildSemantics(CirclePainter oldDelegate) => false;
}
