import 'package:ring_gauge/src/gauge_segment.dart';
import 'package:flutter/material.dart';
import 'package:ring_gauge/src/ring_gauge.dart';

class AnimatedRingGauge extends ImplicitlyAnimatedWidget {
  final double radius;
  final double value;
  final Color backgroundColor;
  final List<GaugeSegment> segments;

  late final double progressFrom;
  late final double progressTo;

  AnimatedRingGauge({
    required this.radius,
    required this.value,
    required this.segments,
    this.backgroundColor = Colors.transparent,
    super.duration = const Duration(milliseconds: 1000),
    super.curve = Curves.linear,
    super.key,
  }) {
    for (var segment in segments) {
      if (segment.value == value) {
        progressFrom = segment.from;
        progressTo = segment.to;
        return;
      }
    }
    progressFrom = 0;
    progressTo = 0;
  }

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _ImplicitlyAnimatedWidgetState();
}

class _ImplicitlyAnimatedWidgetState
    extends AnimatedWidgetBaseState<AnimatedRingGauge> {
  Tween<double>? _progressTween;

  @override
  void initState() {
    controller.forward();
    super.initState();
  }

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _progressTween = visitor(
      _progressTween,
      widget.progressTo,
      (value) => Tween<double>(
        begin: widget.progressFrom,
        end: widget.progressTo,
      ),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Builder(
        builder: (context) {
          final progress = _progressTween!.evaluate(animation).clamp(
                widget.progressFrom,
                widget.progressTo,
              );

          return RingGauge(
            radius: widget.radius,
            value: widget.value,
            progress: progress,
            backgroundColor: widget.backgroundColor,
            segments: widget.segments,
          );
        },
      ),
    );
  }
}
