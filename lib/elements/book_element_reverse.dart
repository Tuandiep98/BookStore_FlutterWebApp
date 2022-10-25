import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:book_store/elements/author_activity_element.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math' as math;

import '../core/bloc/setting_bloc/setting_bloc.dart';
import '../core/dto/author/author_dto.dart';
import '../utils/dialog_utils.dart';
import 'book_details_element.dart';

class BookElementReverse extends StatefulWidget {
  final BookDto book;
  const BookElementReverse({Key? key, required this.book}) : super(key: key);

  @override
  State<BookElementReverse> createState() => _BookElementReverseState();
}

class _BookElementReverseState extends State<BookElementReverse>
    with SingleTickerProviderStateMixin {
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
        onTap: () async {
          await DialogUtils.showDialogWithChild(
            context,
            enableBlur: true,
            child: BookDetailsDialog(book: widget.book),
            padding: const EdgeInsets.all(0),
            paddingCloseBtn: 10,
            backgroundColor: Colors.transparent,
            maxHeight: MediaQuery.of(context).size.height,
            sigmaX: 50,
            forgeShowBottomSheet: true,
          );
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
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    color: context.read<SettingBloc>().getTheme().primaryColor,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .accentColor,
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
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .accentColor,
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
                            Text(
                              'Louisa Clark is no longer hust an ordinary girl\nliving an ordinary life. After the transaformative\nsix months spent.',
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .accentColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      SizedBox(
                          width: 430,
                          height: 1,
                          child: Divider(
                            color: Colors.grey[300],
                          )),
                      AuthorActivityElement(authors: [
                        AuthorDto(
                          id: '01',
                          age: 18,
                          bio: 'this is bio',
                          createdAt: DateTime.now(),
                          name: 'Martin Jr',
                          updatedAt: DateTime.now(),
                          point: 1003,
                          imgUrl: 'assets/images/girl_emoji_01.png',
                        ),
                        AuthorDto(
                          id: '02',
                          age: 18,
                          bio: 'this is bio',
                          createdAt: DateTime.now(),
                          name: 'Megan Fold',
                          updatedAt: DateTime.now(),
                          point: 801,
                          imgUrl: 'assets/images/memoji_2.png',
                        ),
                        AuthorDto(
                          id: '03',
                          age: 18,
                          bio: 'this is bio',
                          createdAt: DateTime.now(),
                          name: 'Thomas Clark',
                          updatedAt: DateTime.now(),
                          point: 1512,
                          imgUrl: 'assets/images/memoji_3.png',
                        ),
                      ], description: 'tuandiep & 2 people likes this.'),
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
                      color: Colors.grey[200],
                      type: MaterialType.transparency,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(3),
                            boxShadow: [
                              BoxShadow(
                                color: context
                                    .read<SettingBloc>()
                                    .getTheme()
                                    .primaryColorDark,
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
