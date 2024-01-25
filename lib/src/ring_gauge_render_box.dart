import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ring_gauge/src/gauge_segment.dart';

class RingGaugeRenderBox extends RenderBox {
  RingGaugeRenderBox({
    required final double radius,
    required final double value,
    required final double progressTo,
    required final Color backgroundColor,
    required final List<GaugeSegment> segments,
  })  : _radius = radius,
        _value = value,
        _progress = progressTo,
        _backgroundColor = backgroundColor,
        _segments = segments;

  double _radius;

  double get radius => _radius;

  set radius(double value) {
    if (_radius != value) {
      _radius = value;
      markNeedsLayout();
    }
  }

  double _value;

  double get value => _value;

  set value(double progressFrom) {
    if (_value != progressFrom) {
      _value = progressFrom;
      markNeedsPaint();
    }
  }

  double _progress;

  double get progress => _progress;

  set progress(double progress) {
    if (_progress != progress) {
      _progress = progress;
      markNeedsPaint();
    }
  }

  Color _backgroundColor;

  Color get backgroundColor => _backgroundColor;

  set backgroundColor(Color backgroundColor) {
    if (_backgroundColor != backgroundColor) {
      _backgroundColor = backgroundColor;
      markNeedsPaint();
    }
  }

  List<GaugeSegment> _segments;

  List<GaugeSegment> get segments => _segments;

  set segments(List<GaugeSegment> segments) {
    if (_segments != segments) {
      _segments = segments;
      markNeedsPaint();
    }
  }

  @override
  void performLayout() {
    size = Size(_radius * 2, _radius * 2);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;
    final center = Offset(size.width / 2, size.height / 2);

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw segments
    for (var segment in segments) {
      final segmentPaint = Paint()
        ..isAntiAlias = true
        ..color = segment.backgroundColor
        ..style = PaintingStyle.fill;

      Path path = Path();
      path
        ..fillType = PathFillType.evenOdd
        ..addOval(Rect.fromCircle(center: center, radius: segment.from))
        ..addOval(Rect.fromCircle(center: center, radius: segment.to));

      canvas.drawPath(path, segmentPaint);
    }

    // Draw progress
    for (var segment in segments) {
      if (value == segment.value) {
        final progressPaint = Paint()
          ..isAntiAlias = true
          ..color = segment.color
          ..style = PaintingStyle.fill;

        Path path = Path();
        path
          ..fillType = PathFillType.evenOdd
          ..addOval(Rect.fromCircle(center: center, radius: segment.from))
          ..addOval(Rect.fromCircle(center: center, radius: progress));

        canvas.drawPath(path, progressPaint);

        break;
      }
    }
  }
}
