import 'package:book_store/core/bloc/setting_bloc/setting_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomButton extends StatelessWidget {
  final IconData? iconData;
  final double width;
  final double height;
  final Function onPressed;
  final Color color;
  final double iconSize;
  final String tooltips;
  final bool hasShadow;
  final String title;
  final Color titleColor;
  final double titleSize;
  final bool hasBorder;
  final double radius;
  const CustomButton({
    Key? key,
    this.iconData,
    this.width = 50,
    this.height = 50,
    required this.onPressed,
    this.color = Colors.white,
    this.iconSize = 35,
    this.tooltips = 'no content',
    this.hasShadow = false,
    this.title = '',
    this.titleColor = Colors.grey,
    this.titleSize = 18,
    this.hasBorder = false,
    this.radius = 24,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasShadow
        ? Container(
            decoration: BoxDecoration(
              border: hasBorder
                  ? Border.all(color: Theme.of(context).colorScheme.secondary)
                  : null,
              borderRadius: BorderRadius.circular(radius),
              color: Theme.of(context).primaryColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 1), //(x,y)
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: MaterialButton(
              minWidth: width,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(radius),
                  right: Radius.circular(radius),
                ),
              ),
              onPressed: () => onPressed(),
              child: Tooltip(
                message: tooltips,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: title != '' ? 5 : 0),
                  child: Row(
                    children: [
                      iconData != null
                          ? Icon(
                              iconData,
                              size: iconSize,
                              color: color,
                            )
                          : const SizedBox.shrink(),
                      title != ''
                          ? const SizedBox(width: 5)
                          : const SizedBox.shrink(),
                      title != ''
                          ? Text(
                              title,
                              style: TextStyle(
                                color: color,
                                fontSize: titleSize,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: hasBorder
                  ? Border.all(color: Theme.of(context).colorScheme.secondary)
                  : null,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: MaterialButton(
              minWidth: width,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(radius),
                  right: Radius.circular(radius),
                ),
              ),
              onPressed: () => onPressed(),
              child: Tooltip(
                message: tooltips,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: title != '' ? 5 : 0),
                  child: Row(
                    children: [
                      iconData != null
                          ? Icon(
                              iconData,
                              size: iconSize,
                              color: color,
                            )
                          : const SizedBox.shrink(),
                      title != ''
                          ? const SizedBox(width: 5)
                          : const SizedBox.shrink(),
                      title != ''
                          ? Text(
                              title,
                              style: TextStyle(
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .colorScheme
                                    .secondary,
                                fontSize: titleSize,
                              ),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
