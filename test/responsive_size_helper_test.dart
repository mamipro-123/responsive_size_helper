import 'package:flutter_test/flutter_test.dart';
import 'package:responsive_size_helper/responsive_size_helper.dart';

void main() {
  group('ResponsiveSizeHelper Tests', () {
    setUp(() {
      // Her test öncesi ResponsiveSizeHelper'ı initialize ediyoruz
      ResponsiveSizeHelper.init(
        designWidth: 375,
        designHeight: 812,
        currentWidth: 400,
        currentHeight: 800,
      );
    });

    test('getWidth doğru orantılı hesaplama yapmalı', () {
      // Test senaryosu: 100px genişlik için orantılı hesaplama
      // (100 / 375) * 400 = 106.67
      expect(ResponsiveSizeHelper.getWidth(100), closeTo(106.67, 0.01));
    });

    test('getHeight doğru orantılı hesaplama yapmalı', () {
      // Test senaryosu: 200px yükseklik için orantılı hesaplama
      // (200 / 812) * 800 = 197.04
      expect(ResponsiveSizeHelper.getHeight(200), closeTo(197.04, 0.01));
    });

    test('Extension method .w doğru çalışmalı', () {
      expect(100.w, ResponsiveSizeHelper.getWidth(100));
    });

    test('Extension method .h doğru çalışmalı', () {
      expect(200.h, ResponsiveSizeHelper.getHeight(200));
    });

    test('Initialize edilmeden kullanılırsa hata vermeli', () {
      // Önce null değerlerle sıfırlayalım
      ResponsiveSizeHelper.init(
        designWidth: 0,
        designHeight: 0,
        currentWidth: 0,
        currentHeight: 0,
      );

      // getWidth için test
      expect(
        () => ResponsiveSizeHelper.getWidth(100),
        throwsA(isA<Exception>().having(
          (error) => error.toString(),
          'message',
          contains('ResponsiveSizeHelper is not initialized'),
        )),
      );

      // getHeight için test
      expect(
        () => ResponsiveSizeHelper.getHeight(100),
        throwsA(isA<Exception>().having(
          (error) => error.toString(),
          'message',
          contains('ResponsiveSizeHelper is not initialized'),
        )),
      );
    });

    test('Negatif değerler için doğru hesaplama yapmalı', () {
      expect((-100).w, ResponsiveSizeHelper.getWidth(-100));
      expect((-200).h, ResponsiveSizeHelper.getHeight(-200));
    });

    test('Sıfır değeri için doğru hesaplama yapmalı', () {
      expect(0.w, 0.0);
      expect(0.h, 0.0);
    });
  });
} 