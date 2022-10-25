import 'package:book_store/elements/book_info_widget.dart';
import 'package:book_store/elements/book_rating_widget.dart';
import 'package:book_store/elements/review_widget.dart';
import 'package:book_store/utils/my_custom_scroll_behavior.dart';
import 'package:book_store/utils/platform_utils.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:book_store/utils/scroll_behavior.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/bloc/setting_bloc/setting_bloc.dart';
import '../core/dto/author/author_dto.dart';
import 'author_activity_element.dart';
import 'category_widget.dart';
import 'custom_button_element.dart';

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
    return IntrinsicHeight(
      child: ScrollConfiguration(
        behavior: CustomScrollBehaviour(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height + 350,
            padding: const EdgeInsets.only(top: 20),
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height /
                  (PlatformUtils.isDevice(context) ? 1 : 2),
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 240,
                  top: 70,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.book.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: context
                                .read<SettingBloc>()
                                .getTheme()
                                .primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        child: Text(
                          widget.book.authors.length > 0
                              ? 'by ${widget.book.authors.first.name}'
                              : 'Anonymous',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 28,
                            color: context
                                .read<SettingBloc>()
                                .getTheme()
                                .primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                      const SizedBox(height: 20),
                      Wrap(
                        children: widget.book.categories.length > 0
                            ? widget.book.categories
                                .map((e) => CategoryWidget(
                                      name: e.name,
                                    ))
                                .toList()
                            : [],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 300,
                  child: Container(
                    padding: const EdgeInsets.only(left: 240),
                    color: Theme.of(context).primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 25),
                        Text(
                          'About',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: context
                                .read<SettingBloc>()
                                .getTheme()
                                .colorScheme
                                .secondary,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                'Louisa Clark is no longer hust an ordinary girl living an ordinary life. After the transaformative six months spent.',
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 24,
                                  color: context
                                      .read<SettingBloc>()
                                      .getTheme()
                                      .colorScheme
                                      .secondary,
                                ),
                              ),
                            ),
                            const SizedBox(width: 50),
                            const BookInfoWidget(),
                          ],
                        ),
                        const SizedBox(height: 20),
                        AuthorActivityElement(
                          authors: [
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
                          ],
                          description: '3 peoples like this.',
                          paddingLeft: 0,
                          fontSize: 18,
                          size: 50,
                          maxWidth: MediaQuery.of(context).size.width * 0.5,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Customer reviews',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                    color: context
                                        .read<SettingBloc>()
                                        .getTheme()
                                        .colorScheme
                                        .secondary,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ReviewWidget(
                                  authorName: 'Megan Fold',
                                  review:
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                                  imgUrl: 'assets/images/girl_emoji_01.png',
                                  datetime: 'July 17, 2021',
                                ),
                                const SizedBox(height: 20),
                                ReviewWidget(
                                  authorName: 'Martin Jr',
                                  review:
                                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
                                  imgUrl: 'assets/images/memoji_2.png',
                                  datetime: 'May 05, 2020',
                                ),
                              ],
                            ),
                            const SizedBox(width: 50),
                            BookRatingWidget(book: widget.book),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          widget.book.authors.length > 0
                              ? ('More from ' + widget.book.authors.first.name)
                              : 'More books',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: context
                                .read<SettingBloc>()
                                .getTheme()
                                .colorScheme
                                .secondary,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: Image.asset(
                                      'assets/images/no-image.png',
                                      fit: BoxFit.cover,
                                      height: 330,
                                      width: 200,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
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
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  left: 15,
                  child: Column(
                    children: [
                      Container(
                        width: 200,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.grey,
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
                          imageUrl: widget.book.imgUrl,
                          errorWidget: (context, url, error) => Image.asset(
                            'assets/images/thumb.jpg',
                            fit: BoxFit.cover,
                          ),
                          fit: BoxFit.cover,
                          height: 50,
                          width: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: 205,
                        height: 30,
                        iconSize: 25,
                        radius: 0,
                        color: Colors.grey,
                        onPressed: () {
                          context.go(context.namedLocation('read-book',
                              params: <String, String>{
                                'bookId': '${widget.book.id}'
                              }));
                        },
                        tooltips: 'Start read this book',
                        title: 'Read online',
                        hasShadow: false,
                        hasBorder: true,
                      ),
                      const SizedBox(height: 10),
                      CustomButton(
                        width: 205,
                        height: 30,
                        iconSize: 25,
                        radius: 0,
                        color: Colors.amber,
                        onPressed: () {},
                        tooltips: 'Listen',
                        title: 'Listen',
                        hasShadow: false,
                        hasBorder: true,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        CustomButton(
                          iconData: Icons.expand_more_rounded,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          tooltips: 'Close',
                          color: Theme.of(context).primaryColor,
                        ),
                        const Spacer(),
                        CustomButton(
                          iconData: Icons.bookmark_border_rounded,
                          onPressed: () {},
                          tooltips: 'Add to bookmarks',
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
