import 'dart:ui';

import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double opacity;
  final bool enabled;
  final double sigmaX;
  final double sigmaY;
  const BlurContainer({
    Key? key,
    required this.child,
    this.color = Colors.grey,
    this.opacity = 0.2,
    this.enabled = true,
    this.sigmaX = 5,
    this.sigmaY = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return enabled
        ? new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(
                sigmaX: sigmaX,
                sigmaY: sigmaY,
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
