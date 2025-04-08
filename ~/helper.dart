import 'dart:ui';

/// Extension for Color class to add the missing withValues method
extension ColorWithValuesExtension on Color {
  /// Returns a new color that matches this color with the specified alpha value
  Color withValues({int? alpha}) {
    return Color.fromARGB(
      alpha ?? this.alpha,
      red,
      green,
      blue,
    );
  }
}
