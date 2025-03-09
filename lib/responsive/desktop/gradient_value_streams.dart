import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final radiusProvider = StreamProvider<double>((ref) async* {
  double radius = 1.0;
  Random random = Random();
  while (true) {
    await Future.delayed(const Duration(seconds: 2));
    radius =
        0.1 + random.nextDouble() * 0.9; // Random radius in range 0.1 - 0.4
    yield radius;
  }
});

final gradientCenterProvider = StreamProvider<Alignment>((ref) async* {
  final random = Random();
  final List<Alignment> alignments = [
    Alignment.topLeft,
    Alignment.topRight,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerLeft,
    Alignment.centerRight,
    Alignment.topCenter,
    Alignment.bottomCenter,
  ];

  while (true) {
    await Future.delayed(const Duration(seconds: 5));
    yield alignments[random.nextInt(alignments.length)];
  }
});
