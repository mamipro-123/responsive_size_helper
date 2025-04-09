import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_size_helper/responsive_size_helper.dart';

void main() {
  group('ResponsiveSizeHelper', () {
    const designWidth = 375.0;
    const designHeight = 812.0;
    const currentWidth = 414.0;
    const currentHeight = 896.0;

    setUp(() {
      ResponsiveSizeHelper.init(
        designWidth: designWidth,
        designHeight: designHeight,
        currentWidth: currentWidth,
        currentHeight: currentHeight,
      );
    });

    test('getWidth converts design width to device width correctly', () {
      const testWidth = 100.0;
      final expectedWidth = (testWidth / designWidth) * currentWidth;
      expect(ResponsiveSizeHelper.getWidth(testWidth), expectedWidth);
    });

    test('getHeight converts design height to device height correctly', () {
      const testHeight = 200.0;
      final expectedHeight = (testHeight / designHeight) * currentHeight;
      expect(ResponsiveSizeHelper.getHeight(testHeight), expectedHeight);
    });

    test('extension methods work correctly', () {
      const testValue = 150.0;
      expect(testValue.w, ResponsiveSizeHelper.getWidth(testValue));
      expect(testValue.h, ResponsiveSizeHelper.getHeight(testValue));
    });

    test('throws exception when not initialized', () {
      ResponsiveSizeHelper.init(
        designWidth: 0,
        designHeight: 0,
        currentWidth: 0,
        currentHeight: 0,
      );

      expect(
        () => ResponsiveSizeHelper.getWidth(100),
        throwsException,
      );
      expect(
        () => ResponsiveSizeHelper.getHeight(100),
        throwsException,
      );
    });
  });
}
