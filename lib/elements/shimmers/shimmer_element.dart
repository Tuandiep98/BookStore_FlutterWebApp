import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerElement extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final BoxDecoration? decoration;
  const ShimmerElement({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: decoration ?? null,
      child: Shimmer.fromColors(
        baseColor: Colors.red,
        highlightColor: Colors.yellow,
        child: child,
      ),
    );
  }
}
