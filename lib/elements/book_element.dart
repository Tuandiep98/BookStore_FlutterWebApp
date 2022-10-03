import 'package:flutter/material.dart';
import 'dart:math' as math;

class BookElement extends StatefulWidget {
  const BookElement({Key? key}) : super(key: key);

  @override
  State<BookElement> createState() => _BookElementState();
}

class _BookElementState extends State<BookElement> {
  double elevation = 4.0;
  double scale = 1.0;
  Offset translate = const Offset(0, 0);

  var color = (math.Random().nextDouble() * 0xFFFFFF).toInt();

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
            color: Color(color).withOpacity(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  'After You',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const Text(
                  'by Jojo Moyes',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: const [
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      '1.987 voters',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Louisa Clark is no longer hust an ordinary girl\nliving an ordinary life. After the transaforMative\nsix months spent.',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
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
                      'See the book',
                      style: TextStyle(
                        color: Color(color).withOpacity(1.0),
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
              color: Colors.grey,
              type: MaterialType.transparency,
              child: Center(
                child: Container(
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
                  child: Image.asset(
                    'assets/images/thumb.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
