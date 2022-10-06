import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:book_store/elements/author_activity_element.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class BookElementReverse extends StatefulWidget {
  final BookDto book;
  const BookElementReverse({Key? key, required this.book}) : super(key: key);

  @override
  State<BookElementReverse> createState() => _BookElementReverseState();
}

class _BookElementReverseState extends State<BookElementReverse> {
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        hoverColor: Colors.transparent,
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
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0.0, 1.0), //(x,y)
                    //     blurRadius: 10.0,
                    //   ),
                    // ],
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 180, right: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Text(
                              widget.book.title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              widget.book.authors.length > 0
                                  ? 'by ${widget.book.authors.first.name}'
                                  : 'Anonymous',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(Icons.star_rounded,
                                    size: 15, color: Colors.grey),
                                Icon(Icons.star_rounded,
                                    size: 15, color: Colors.grey),
                                Icon(Icons.star_rounded,
                                    size: 15, color: Colors.grey),
                                Icon(Icons.star_rounded,
                                    size: 15, color: Colors.grey),
                                Icon(Icons.star_rounded,
                                    size: 15, color: Colors.grey),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text(
                              'Louisa Clark is no longer hust an ordinary girl\nliving an ordinary life. After the transaformative\nsix months spent.',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const SizedBox(width: 430, height: 1, child: Divider()),
                      AuthorActivityElement(
                          authors: [0, 1, 2],
                          description: 'tuandiep & 2 people likes this.'),
                    ],
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
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0.0, 1.0), //(x,y)
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          height: 240,
                          width: 150,
                          child: CachedNetworkImage(
                            imageUrl: widget.book.imgUrl,
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/thumb.jpg',
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            height: 240,
                            width: 150,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
