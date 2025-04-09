import 'package:flutter/material.dart';
import 'package:responsive_size_helper_plus/responsive_size_helper_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Size Helper Demo',
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
    // Initialize the ResponsiveSizeHelper with design dimensions
    ResponsiveSizeHelper.init(
      designWidth: 375, // iPhone X width
      designHeight: 812, // iPhone X height
      currentWidth: MediaQuery.of(context).size.width,
      currentHeight: MediaQuery.of(context).size.height,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          'Responsive Demo',
          style: TextStyle(fontSize: 20.w),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Responsive Card
            Container(
              width: 343.w,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.w,
                    offset: Offset(0, 4.h),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Responsive Card',
                    style: TextStyle(
                      fontSize: 24.w,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'This card maintains its proportions across different screen sizes.',
                    style: TextStyle(fontSize: 16.w),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),

            // Responsive Buttons
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Button 1',
                    style: TextStyle(fontSize: 16.w),
                  ),
                ),
                SizedBox(width: 16.w),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 12.h,
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Button 2',
                    style: TextStyle(fontSize: 16.w),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.h),

            // Responsive Image Container
            Container(
              width: 343.w,
              height: 200.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 48.w,
                  color: Colors.grey[600],
                ),
              ),
            ),
            SizedBox(height: 24.h),

            // Responsive Form Fields
            TextField(
              decoration: InputDecoration(
                labelText: 'Responsive Input',
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.w),
                ),
              ),
              style: TextStyle(fontSize: 16.w),
            ),
            SizedBox(height: 16.h),

            // Device Info
            Text(
              'Device Information:',
              style: TextStyle(
                fontSize: 18.w,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Design Size: 375x812',
              style: TextStyle(fontSize: 14.w),
            ),
            Text(
              'Current Size: ${MediaQuery.of(context).size.width.toStringAsFixed(1)}x${MediaQuery.of(context).size.height.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 14.w),
            ),
          ],
        ),
      ),
    );
  }
}
