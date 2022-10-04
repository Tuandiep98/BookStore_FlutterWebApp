import 'package:book_store/elements/shimmers/shimmer_element.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BookShimmer extends StatefulWidget {
  const BookShimmer({Key? key}) : super(key: key);

  @override
  State<BookShimmer> createState() => _BookShimmerState();
}

class _BookShimmerState extends State<BookShimmer> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);

  var color = Colors.grey[300];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {},
          onHover: (value) {
            if (value) {
              setState(() {
                elevation = 3.0;
                scale = 1.0473;
                translate = const Offset(2, 2);
              });
            } else {
              setState(() {
                elevation = 1.0;
                scale = 1.0;
                translate = const Offset(0, 0);
              });
            }
          },
          child: Container(
            height: 240,
            padding: const EdgeInsets.only(left: 180),
            color: color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                ShimmerElement(
                  width: 60,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                ShimmerElement(
                  width: 30,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    SizedBox(width: 10),
                    ShimmerElement(
                      width: 15,
                      height: 5,
                      child: Text(
                        '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ShimmerElement(
                  width: 50,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ShimmerElement(
                  width: 30,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ShimmerElement(
                  width: 50,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ShimmerElement(
                  width: 30,
                  height: 5,
                  child: Text(
                    '',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Colors.white,
                    ),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 20),
                ShimmerElement(
                  height: 30,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 1), //(x,y)
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '',
                      style: TextStyle(
                        color: color,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        top: 15,
        left: 15,
        child: Transform.translate(
          offset: translate,
          child: AnimatedScale(
            scale: scale,
            duration: const Duration(milliseconds: 200),
            child: Material(
              elevation: elevation,
              color: Colors.grey[200],
              type: MaterialType.transparency,
              child: Center(
                child: ShimmerElement(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  height: 240,
                  width: 150,
                  child: Text(''),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}