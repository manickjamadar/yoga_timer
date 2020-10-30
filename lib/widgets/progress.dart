import 'dart:ui';

import 'package:flutter/animation.dart';

class Progress {
  final double value;

  const Progress._(this.value);
  factory Progress(double value) {
    final double actualValue = value < 0 ? 0 : (value > 1 ? 1 : value);
    return Progress._(actualValue);
  }

  static Progress lerp(Progress begin, Progress end, double t) {
    return Progress._(lerpDouble(begin.value, end.value, t));
  }
}

class ProgressTween extends Tween<Progress> {
  final Progress begin;
  final Progress end;
  ProgressTween(this.begin, this.end) : super(begin: begin, end: end);

  @override
  Progress lerp(double t) {
    return Progress.lerp(begin, end, t);
  }
}
