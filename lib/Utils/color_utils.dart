import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorUtils {
  static Color getRandomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
