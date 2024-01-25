import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:ring_gauge/src/gauge_segment.dart';
import 'package:ring_gauge/src/ring_gauge_render_box.dart';

class RingGauge extends LeafRenderObjectWidget {
  const RingGauge({
    required this.radius,
    required this.value,
    required this.progress,
    required this.backgroundColor,
    required this.segments,
    super.key,
  });

  final double radius;
  final double value;
  final double progress;
  final Color backgroundColor;
  final List<GaugeSegment> segments;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RingGaugeRenderBox(
      radius: radius,
      value: value,
      progressTo: progress,
      backgroundColor: backgroundColor,
      segments: segments,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RingGaugeRenderBox renderObject,
  ) {
    renderObject
      ..radius = radius
      ..value = value
      ..progress = progress
      ..backgroundColor = backgroundColor
      ..segments = segments;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('radius', radius));
    properties.add(DoubleProperty('value', value));
    properties.add(DoubleProperty('progressTo', progress));
    properties
        .add(DiagnosticsProperty<Color>('backgroundColor', backgroundColor));
    properties
        .add(DiagnosticsProperty<List<GaugeSegment>>('segments', segments));
  }
}
