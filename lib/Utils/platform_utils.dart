import 'package:flutter/foundation.dart';

class PlatformUtils {
  static bool isDevice() {
    return (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);
  }

  static bool isWebsite() {
    return (defaultTargetPlatform == TargetPlatform.windows ||
        defaultTargetPlatform == TargetPlatform.linux ||
        defaultTargetPlatform == TargetPlatform.macOS);
  }
}
