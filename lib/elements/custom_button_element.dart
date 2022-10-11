import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData iconData;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;
  final double iconSize;
  final String tooltips;
  const CustomButton({
    Key? key,
    required this.iconData,
    this.width = 50,
    this.height = 50,
    required this.onPressed,
    this.color = Colors.white,
    this.iconSize = 35,
    this.tooltips = 'no content',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 50,
      height: 50,
      shape: CircleBorder(),
      onPressed: () => onPressed(),
      child: Tooltip(
        message: tooltips,
        child: Container(
          // width: width,
          // height: height,
          child: Icon(
            iconData,
            size: iconSize,
            color: color,
          ),
        ),
      ),
    );
  }
}
