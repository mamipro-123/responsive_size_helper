import 'package:flutter/material.dart';
import 'package:responsive_size_helper/responsive_size_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          // Initialize ResponsiveSizeHelper
          ResponsiveSizeHelper.init(
            designWidth: 375, // Figma design width
            designHeight: 812, // Figma design height
            currentWidth: MediaQuery.of(context).size.width,
            currentHeight: MediaQuery.of(context).size.height,
          );

          return const MyHomePage();
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ResponsiveSizeHelper Example'),
      ),
      body: Center(
        child: Container(
          // Using responsive width and height
          width: ResponsiveSizeHelper.getWidth(200),
          height: ResponsiveSizeHelper.getHeight(100),
          color: Colors.blue,
          child: const Center(
            child: Text('Responsive Container'),
          ),
        ),
      ),
    );
  }
} 