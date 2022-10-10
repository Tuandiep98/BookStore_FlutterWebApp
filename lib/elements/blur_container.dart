import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double opacity;
  final bool enabled;
  const BlurContainer({
    Key? key,
    required this.child,
    this.color = Colors.grey,
    this.opacity = 0.2,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(
                sigmaX: 50.0,
                sigmaY: 5.0,
                tileMode: TileMode.decal,
              ),
              child: Container(
                decoration:
                    new BoxDecoration(color: color!.withOpacity(opacity)),
                child: child,
              ),
            ),
          )
        : Container(child: child);
  }
}
