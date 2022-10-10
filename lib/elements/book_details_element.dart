import 'package:book_store/utils/platform_utils.dart';
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
  late ScrollController _relatedBooksController;
  late ScrollController _imageOfBookController;

  @override
  void initState() {
    _relatedBooksController = ScrollController();
    _imageOfBookController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _relatedBooksController.dispose();
    _imageOfBookController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height /
              (PlatformUtils.isDevice(context) ? 1 : 2),
          minWidth: MediaQuery.of(context).size.width,
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width,
        ),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 200,
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
                          Icon(Icons.star_rounded,
                              size: 35, color: Colors.amber),
                          Icon(Icons.star_rounded,
                              size: 35, color: Colors.amber),
                          Icon(Icons.star_rounded,
                              size: 35, color: Colors.amber),
                          Icon(Icons.star_rounded,
                              size: 35, color: Colors.amber),
                          Icon(Icons.star_rounded,
                              size: 35, color: Colors.grey),
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
                      padding: const EdgeInsets.only(left: 15),
                      child: AuthorActivityElement(
                        authors: [0, 1, 2],
                        description: '3 peoples like this.',
                        paddingLeft: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'widget.book.imgUrl',
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/thumb.jpg',
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.book.categories.length > 0
                                ? ('More of ' +
                                    widget.book.categories.first.name)
                                : 'Related books',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _imageOfBookController,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: 'widget.book.imgUrl',
                            errorWidget: (context, url, error) => Image.asset(
                              'assets/images/thumb.jpg',
                              fit: BoxFit.cover,
                            ),
                            fit: BoxFit.cover,
                            height: 50,
                            width: 30,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            widget.book.authors.length > 0
                                ? ('More of ' + widget.book.authors.first.name)
                                : 'More books',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ScrollConfiguration(
                        behavior: MyCustomScrollBehavior(),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          controller: _relatedBooksController,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const SizedBox(width: 10),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Image.asset(
                                  'assets/images/no-image.png',
                                  fit: BoxFit.cover,
                                  height: 330,
                                  width: 200,
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
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
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 15,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
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
      ),
    );
  }
}
