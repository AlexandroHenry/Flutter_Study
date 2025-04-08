import 'package:flutter/material.dart';

/// Utility class for color-related operations
class ColorUtils {
  /// Returns a rainbow color based on the index
  /// Colors follow the rainbow sequence: red, orange, yellow, green, blue, indigo, purple
  static Color getColorByIndex(int index) {
    final List<Color> rainbowColors = [
      Colors.red, // 빨강
      Colors.orange, // 주황
      Colors.yellow, // 노랑
      Colors.green, // 초록
      Colors.blue, // 파랑
      Colors.indigo, // 남색
      Colors.purple, // 보라
    ];

    return rainbowColors[index % rainbowColors.length];
  }
}
