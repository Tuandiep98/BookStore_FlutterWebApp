import 'package:book_store/Utils/platform_utils.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Utils/scroll_behavior.dart';
import '../core/bloc/setting_bloc/setting_bloc.dart';
import 'author_activity_element.dart';

class BookDetailsDialog extends StatefulWidget {
  final BookDto book;
  const BookDetailsDialog({Key? key, required this.book}) : super(key: key);

  @override
  State<BookDetailsDialog> createState() => _BookDetailsDialogState();
}

class _BookDetailsDialogState extends State<BookDetailsDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      height: PlatformUtils.isDevice(context)
          ? MediaQuery.of(context).size.height * 0.85
          : MediaQuery.of(context).size.height * 0.5,
      width: PlatformUtils.isDevice(context)
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width * 0.5,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Container(
              color: context.read<SettingBloc>().getTheme().primaryColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: Text(
                      widget.book.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: Text(
                      widget.book.authors.length > 0
                          ? 'by ${widget.book.authors.first.name}'
                          : 'Anonymous',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Icon(Icons.star_rounded, size: 35, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 35, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 35, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 35, color: Colors.amber),
                        Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: const Text(
                      'Louisa Clark is no longer hust an ordinary girl\nliving an ordinary life. After the transaformative\nsix months spent.',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: const Divider(),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 190),
                    child: AuthorActivityElement(
                      authors: [0, 1, 2],
                      description: '3 peoples like this.',
                      paddingLeft: 0,
                    ),
                  ),
                  ScrollConfiguration(
                    behavior: MyCustomScrollBehavior(),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const SizedBox(width: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/no-image.png',
                              fit: BoxFit.cover,
                              height: 330,
                              width: 200,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 370,
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(3),
                boxShadow: [
                  BoxShadow(
                    color:
                        context.read<SettingBloc>().getTheme().primaryColorDark,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: CachedNetworkImage(
                imageUrl: 'widget.book.imgUrl',
                errorWidget: (context, url, error) => Image.asset(
                  'assets/images/thumb.jpg',
                  fit: BoxFit.cover,
                ),
                fit: BoxFit.cover,
                height: 250,
                width: 160,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
