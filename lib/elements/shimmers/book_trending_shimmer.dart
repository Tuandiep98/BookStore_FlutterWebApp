import 'package:flutter/material.dart';
import 'dart:math' as math;

class BookActivityShimmer extends StatefulWidget {
  final double size;
  final double thickness;
  final double fontSize;
  final String top;
  const BookActivityShimmer({
    Key? key,
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.top = '1',
  }) : super(key: key);

  @override
  State<BookActivityShimmer> createState() => _BookActivityShimmerState();
}

class _BookActivityShimmerState extends State<BookActivityShimmer> {
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
            width: 70,
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
                  left: 25,
                  bottom: 15,
                  child: Container(
                    width: widget.size,
                    height: widget.size * 1.6,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white,
                        width: widget.thickness,
                      ),
                    ),
                    child: Container(
                      width: widget.size,
                      height: widget.size * 1.6,
                      color: Colors.white.withOpacity(0.8),
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
                  Container(
                    width: 60,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 120,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 40,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    width: 50,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 80,
                    height: 8,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
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
