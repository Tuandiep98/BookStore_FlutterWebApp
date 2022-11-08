import 'package:book_store/elements/custom_button_2.dart';
import 'package:book_store/elements/shimmers/shimmer_element.dart';
import 'package:flutter/material.dart';

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
                Container(
                  width: 150,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  width: 80,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    SizedBox(width: 10),
                    Container(
                      width: 50,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  width: 150,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 60,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 150,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 50,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 20),
                CustomButton2(
                  onPressed: () {},
                  title: 'See the book',
                  forgeWhite: true,
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
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
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
