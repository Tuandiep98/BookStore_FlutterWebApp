import 'package:flutter/material.dart';
import 'dart:math' as math;

class BookActivityElement extends StatefulWidget {
  final List<int> books;
  final String title;
  final String author;
  final String description;
  final double size;
  final double thickness;
  final double fontSize;
  final String top;
  const BookActivityElement({
    super.key,
    required this.books,
    this.title = 'Title',
    this.author = 'Author',
    this.description = 'Description',
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.top = '1',
  });

  @override
  State<BookActivityElement> createState() => _BookActivityElementState();
}

class _BookActivityElementState extends State<BookActivityElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      constraints: const BoxConstraints(
        maxHeight: 100,
        maxWidth: 460,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  left: 0,
                  child: Text(
                    widget.top,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 15,
                  child: Container(
                    width: widget.size,
                    height: widget.size * 1.6,
                    decoration: BoxDecoration(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                              .withOpacity(0.95),
                      border: Border.all(
                        color: Colors.white,
                        width: widget.thickness,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              width: 380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widget.fontSize,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'by ${widget.author}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: widget.fontSize - 3,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: widget.fontSize - 5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
