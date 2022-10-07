import 'package:book_store/Utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class AuthorActivityElement extends StatefulWidget {
  final List<int> authors;
  final String description;
  final double size;
  final double thickness;
  final double fontSize;
  final double paddingLeft;
  const AuthorActivityElement({
    Key? key,
    required this.authors,
    this.description = 'Description',
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.paddingLeft = 15,
  }) : super(key: key);

  @override
  State<AuthorActivityElement> createState() => _AuthorActivityElementState();
}

class _AuthorActivityElementState extends State<AuthorActivityElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.paddingLeft),
      constraints: BoxConstraints(
        maxHeight: 40,
        maxWidth: 340,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: widget.authors
                  .map((index) => Positioned(
                        left: index * 16,
                        child: Container(
                          width: widget.size,
                          height: widget.size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorUtils.getRandomColor(),
                            border: Border.all(
                              color: Colors.white,
                              width: widget.thickness,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: 5),
          Divider(),
          Expanded(
            child: SizedBox(
              width: 300,
              child: Text(
                widget.description,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: widget.fontSize,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
