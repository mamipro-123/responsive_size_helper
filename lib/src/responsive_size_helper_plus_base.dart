/// A helper class that provides utilities for creating responsive layouts
/// by converting Figma design dimensions to device-specific dimensions.
class ResponsiveSizeHelper {
  /// The width of the design in Figma (or other design tool)
  static double? _designWidth;

  /// The height of the design in Figma (or other design tool)
  static double? _designHeight;

  /// The current device width
  static double? _currentWidth;

  /// The current device height
  static double? _currentHeight;

  /// Initialize the helper with design dimensions and current device dimensions.
  ///
  /// This should be called as early as possible in your app's lifecycle,
  /// typically in the root widget's build method.
  ///
  /// Example:
  /// ```dart
  /// ResponsiveSizeHelper.init(
  ///   designWidth: 375,
  ///   designHeight: 812,
  ///   currentWidth: MediaQuery.of(context).size.width,
  ///   currentHeight: MediaQuery.of(context).size.height,
  /// );
  /// ```
  ///
  /// [designWidth] The width of your design in Figma (or other design tool)
  /// [designHeight] The height of your design in Figma (or other design tool)
  /// [currentWidth] The current device width
  /// [currentHeight] The current device height
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

  /// Converts a width dimension from design pixels to device-specific pixels.
  ///
  /// Example:
  /// ```dart
  /// width: ResponsiveSizeHelper.getWidth(200),
  /// ```
  ///
  /// [width] The width in design pixels
  /// Returns the responsive width for the current device
  static double getWidth(double width) {
    if (_designWidth == null || _currentWidth == null || _designWidth == 0) {
      throw Exception(
        'ResponsiveSizeHelper is not initialized. Call init() first.',
      );
    }
    return (width / _designWidth!) * _currentWidth!;
  }

  /// Converts a height dimension from design pixels to device-specific pixels.
  ///
  /// Example:
  /// ```dart
  /// height: ResponsiveSizeHelper.getHeight(100),
  /// ```
  ///
  /// [height] The height in design pixels
  /// Returns the responsive height for the current device
  static double getHeight(double height) {
    if (_designHeight == null || _currentHeight == null || _designHeight == 0) {
      throw Exception(
        'ResponsiveSizeHelper is not initialized. Call init() first.',
      );
    }
    return (height / _designHeight!) * _currentHeight!;
  }
}

/// Extension methods for convenient responsive size conversion
extension ResponsiveSizeExtension on num {
  /// Converts the number to a responsive width
  ///
  /// Example:
  /// ```dart
  /// width: 200.w,
  /// ```
  double get w => ResponsiveSizeHelper.getWidth(toDouble());

  /// Converts the number to a responsive height
  ///
  /// Example:
  /// ```dart
  /// height: 100.h,
  /// ```
  double get h => ResponsiveSizeHelper.getHeight(toDouble());
}
