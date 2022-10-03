import 'package:flutter/material.dart';

class WebPlatform extends StatefulWidget {
  final Widget header;
  final Widget body;
  const WebPlatform({
    super.key,
    required this.header,
    required this.body,
  });

  @override
  State<WebPlatform> createState() => _WebPlatformState();
}

class _WebPlatformState extends State<WebPlatform> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.body,
        Positioned(
          left: 0,
          top: 0,
          child: widget.header,
        ),
      ],
    );
  }
}
