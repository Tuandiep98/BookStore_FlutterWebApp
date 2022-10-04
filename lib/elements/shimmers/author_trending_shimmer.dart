import 'package:flutter/material.dart';

class AuthorTrendingShimmer extends StatefulWidget {
  final String description;
  final double size;
  final double thickness;
  final double fontSize;
  final double paddingLeft;
  const AuthorTrendingShimmer({
    Key? key,
    this.description = 'Description',
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.paddingLeft = 15,
  }) : super(key: key);

  @override
  State<AuthorTrendingShimmer> createState() => _AuthorTrendingShimmerState();
}

class _AuthorTrendingShimmerState extends State<AuthorTrendingShimmer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.paddingLeft, top: 10, bottom: 10),
      constraints: const BoxConstraints(
        maxHeight: 60,
        maxWidth: 460,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Container(
              width: widget.size,
              height: widget.size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(1.0),
                border: Border.all(
                  color: Colors.white,
                  width: widget.thickness,
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              width: 380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  const SizedBox(height: 10),
                  Container(
                    width: 80,
                    height: 10,
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
