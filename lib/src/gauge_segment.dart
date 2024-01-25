import 'package:flutter/material.dart';

class GaugeSegment {
  const GaugeSegment({
    required this.from,
    required this.to,
    required this.value,
    required this.color,
    this.backgroundColor = Colors.transparent,
  });

  final double from;
  final double to;
  final double value;
  final Color color;
  final Color backgroundColor;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GaugeSegment &&
          runtimeType == other.runtimeType &&
          from == other.from &&
          to == other.to &&
          value == other.value &&
          color == other.color &&
          backgroundColor == other.backgroundColor;

  @override
  int get hashCode =>
      from.hashCode ^
      to.hashCode ^
      value.hashCode ^
      color.hashCode ^
      backgroundColor.hashCode;
}
