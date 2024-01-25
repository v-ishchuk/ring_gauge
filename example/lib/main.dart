import 'package:flutter/material.dart';
import 'package:ring_gauge/ring_gauge.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Circle gauge'),
      ),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _MainGauge(value: 1),
            SizedBox(height: 24),
            _MinimizedGauge(value: 2),
          ],
        ),
      ),
    );
  }
}

class _MainGauge extends StatelessWidget {
  const _MainGauge({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return AnimatedRingGauge(
      radius: 120,
      value: value,
      segments: const [
        GaugeSegment(
          from: 0,
          to: 12,
          value: 5,
          color: Color(0xFFFF4127),
        ),
        GaugeSegment(
          from: 12,
          to: 40,
          value: 4,
          backgroundColor: Color(0xFF174462),
          color: Color(0xFFEF6F5E),
        ),
        GaugeSegment(
          from: 40,
          to: 60,
          value: 3,
          backgroundColor: Color(0xFF07304B),
          color: Color(0xFFFECB03),
        ),
        GaugeSegment(
          from: 68,
          to: 84,
          value: 2,
          backgroundColor: Color(0xFF07304B),
          color: Color(0xFF89E6FD),
        ),
        GaugeSegment(
          from: 92,
          to: 100,
          value: 1,
          backgroundColor: Color(0xFF07304B),
          color: Colors.white,
        ),
      ],
    );
  }
}

class _MinimizedGauge extends StatelessWidget {
  const _MinimizedGauge({required this.value});

  final double value;

  @override
  Widget build(BuildContext context) {
    return AnimatedRingGauge(
      radius: 22.5,
      value: value,
      backgroundColor: const Color(0xFF174462),
      segments: const [
        GaugeSegment(
          from: 0,
          to: 5.5,
          value: 5,
          color: Color(0xFFFF4127),
        ),
        GaugeSegment(
          from: 0,
          to: 9.5,
          value: 4,
          color: Color(0xFFEF6F5E),
        ),
        GaugeSegment(
          from: 0,
          to: 13.5,
          value: 3,
          color: Color(0xFFFECB03),
        ),
        GaugeSegment(
          from: 11.5,
          to: 17.5,
          value: 2,
          color: Color(0xFF89E6FD),
        ),
        GaugeSegment(
          from: 18.5,
          to: 22.5,
          value: 1,
          color: Colors.white,
        ),
      ],
    );
  }
}
