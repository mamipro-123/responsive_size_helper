
# Responsive Size Helper Plus

  

[![pub package](https://img.shields.io/pub/v/responsive_size_helper_plus.svg)](https://pub.dev/packages/responsive_size_helper_plus)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

  

A powerful Flutter package that helps you create pixel-perfect responsive layouts by automatically converting Figma design dimensions to device-specific dimensions. This package makes it incredibly easy to maintain design consistency across different screen sizes and devices.

  

## Features

  

- 🎯 **Pixel-Perfect Conversion**: Automatically converts Figma design dimensions to device-specific sizes

- 🚀 **Simple Integration**: Easy to initialize and use with intuitive API

- 📱 **Cross-Platform Support**: Works on all platforms (iOS, Android, Web, Desktop)

- ⚡ **Performance Optimized**: Minimal runtime overhead

- 🧩 **Extension Methods**: Convenient extension methods for quick usage

- 🛠️ **Type-Safe**: Fully type-safe API with null safety support

  

## Installation

  

Add this to your package's `pubspec.yaml` file:

  

```yaml

dependencies:

responsive_size_helper_plus:  ^1.0.3

```

  

## Usage

  

### Initialization

  

Initialize the helper with your Figma design dimensions and current device dimensions:

  

```dart

import  'package:responsive_size_helper_plus/responsive_size_helper_plus.dart';

import  'package:flutter/material.dart';

  

void  main() {

runApp(MyApp());

}

  

class  MyApp  extends  StatelessWidget {

@override

Widget  build(BuildContext context) {

// Initialize once at app startup

ResponsiveSizeHelper.init(

designWidth:  375, // Your Figma design width

designHeight:  812, // Your Figma design height

currentWidth:  MediaQuery.of(context).size.width,

currentHeight:  MediaQuery.of(context).size.height,

);

return  MaterialApp(

// Your app code

);

}

}

```

  

### Using the Helper

  

You can use the helper in two ways:

  

1. Using extension methods (Recommended):

```dart

Container(

width:  200.w, // Converts 200 design pixels to responsive width

height:  100.h, // Converts 100 design pixels to responsive height

child:  Text('Hello World'),

)

```

  

2. Using direct methods:

```dart

Container(

width:  ResponsiveSizeHelper.getWidth(200),

height:  ResponsiveSizeHelper.getHeight(100),

child:  Text('Hello World'),

)

```

  

## Example

  

Here's a complete example of how to use the package:

  

```dart

import  'package:flutter/material.dart';

import  'package:responsive_size_helper_plus/responsive_size_helper_plus.dart';

  

class  ResponsiveCard  extends  StatelessWidget {

@override

Widget  build(BuildContext context) {

return  Container(

width:  327.w,

height:  180.h,

padding:  EdgeInsets.all(16.w),

decoration:  BoxDecoration(

borderRadius:  BorderRadius.circular(12.w),

color:  Colors.white,

boxShadow: [

BoxShadow(

color:  Colors.black.withOpacity(0.1),

blurRadius:  10.w,

offset:  Offset(0, 4.h),

),

],

),

child:  Column(

crossAxisAlignment:  CrossAxisAlignment.start,

children: [

Text(

'Responsive Card',

style:  TextStyle(

fontSize:  24.w,

fontWeight:  FontWeight.bold,

),

),

SizedBox(height:  8.h),

Text(

'This card will maintain its proportions across different screen sizes.',

style:  TextStyle(fontSize:  16.w),

),

],

),

);

}

}

```

  

## Best Practices

  

1. Initialize the helper as early as possible in your app lifecycle

2. Use the extension methods (.w and .h) for cleaner code

3. Keep your design dimensions consistent with your Figma design

4. Consider using different design dimensions for tablet/desktop layouts

  

## Contributing

  

Contributions are welcome! If you find a bug or want to add a feature:

  

1. Fork the repository

2. Create your feature branch (`git checkout -b feature/amazing-feature`)

3. Commit your changes (`git commit -m 'Add some amazing feature'`)

4. Push to the branch (`git push origin feature/amazing-feature`)

5. Open a Pull Request

  

## License

  

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

  

## Support

  

If you find this package helpful, please give it a star on [GitHub](https://github.com/mamipro-123/responsive_size_helper_plus) and consider supporting its development.