import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;

import '../core/bloc/setting_bloc/setting_bloc.dart';

class BookElement extends StatefulWidget {
  final BookDto book;
  const BookElement({Key? key, required this.book}) : super(key: key);

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
          onTap: () {
            context.go('/page2');
          },
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
            height: 250,
            padding: const EdgeInsets.only(left: 180),
            color: context.read<SettingBloc>().isDarkMode()
                ? context.read<SettingBloc>().getTheme().primaryColor
                : Color(color).withOpacity(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  widget.book.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.book.authors.length > 0
                      ? widget.book.authors.first.name
                      : 'Anonymous',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    Icon(Icons.star_rounded, size: 20, color: Colors.white),
                    SizedBox(width: 10),
                    Text(
                      '${widget.book.rate} voters',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  widget.book.description,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.white,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
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
                        color: context.read<SettingBloc>().isDarkMode()
                            ? context
                                .read<SettingBloc>()
                                .getTheme()
                                .primaryColor
                            : Color(color).withOpacity(1.0),
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
              color: context.read<SettingBloc>().isDarkMode()
                  ? context.read<SettingBloc>().getTheme().primaryColor
                  : Color(color).withOpacity(1.0),
              type: MaterialType.transparency,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: context.read<SettingBloc>().isDarkMode()
                            ? context
                                .read<SettingBloc>()
                                .getTheme()
                                .primaryColor
                            : Color(color).withOpacity(1.0),
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 15.0,
                      ),
                    ],
                  ),
                  height: 240,
                  width: 150,
                  child: CachedNetworkImage(
                    imageUrl: 'widget.book.imgUrl',
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
    ]);
  }
}
