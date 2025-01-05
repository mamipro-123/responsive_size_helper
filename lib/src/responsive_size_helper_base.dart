// import 'package:flutter/material.dart';

class ResponsiveSizeHelper {
  static double? _designWidth;
  static double? _designHeight;
  static double? _currentWidth;
  static double? _currentHeight;

  /// Initialize the helper with design dimensions
  static void init({
    required double designWidth,
    required double designHeight,
    required double currentWidth,
    required double currentHeight,
  }) {
    _designWidth = designWidth;
    _designHeight = designHeight;
    _currentWidth = currentWidth;
    _currentHeight = currentHeight;
  }

  /// Calculate responsive width
  static double getWidth(double width) {
    if (_designWidth == null || _currentWidth == null || _designWidth == 0) {
      throw Exception('ResponsiveSizeHelper is not initialized. Call init() first.');
    }
    return (width / _designWidth!) * _currentWidth!;
  }

  /// Calculate responsive height
  static double getHeight(double height) {
    if (_designHeight == null || _currentHeight == null || _designHeight == 0) {
      throw Exception('ResponsiveSizeHelper is not initialized. Call init() first.');
    }
    return (height / _designHeight!) * _currentHeight!;
  }
}

extension ResponsiveSizeExtension on num {
  double get w => ResponsiveSizeHelper.getWidth(this.toDouble());
  double get h => ResponsiveSizeHelper.getHeight(this.toDouble());
} 