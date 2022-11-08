import 'package:flutter/material.dart';

class PlatformUtils {
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isTablet(BuildContext context) {
    return (MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1024);
  }

  static bool isWebsite(BuildContext context) {
    return MediaQuery.of(context).size.width > 1024;
  }
}
