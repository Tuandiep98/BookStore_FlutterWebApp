import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformUtils {
  static bool isDevice(BuildContext context) {
    return (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android ||
        MediaQuery.of(context).size.width < 760);
  }

  static bool isWebsite() {
    return (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS);
  }
}
