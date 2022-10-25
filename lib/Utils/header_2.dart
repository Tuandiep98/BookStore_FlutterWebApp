import 'package:book_store/core/bloc/book_reader_bloc/book_reader_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../core/bloc/book_bloc/book_bloc.dart';
import '../core/dto/book/book_dto.dart';
import '../elements/blur_container.dart';
import '../elements/custom_button_element.dart';

class Header2 extends StatefulWidget {
  final String bookId;
  const Header2({
    super.key,
    this.bookId = '',
  });

  @override
  State<Header2> createState() => _Header2State();
}

class _Header2State extends State<Header2> {
  BookDto? book;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.bookId != '') {
        book = context
            .read<BookBloc>()
            .getCurrentBooks()
            .firstWhere((x) => x.id == widget.bookId);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookReaderBloc, BookReaderState>(
      builder: (context, state) {
        return BlurContainer(
          color: Colors.grey.shade200,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 80,
            color: Theme.of(context).backgroundColor.withOpacity(0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    context.go("/");
                  },
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      book != null
                          ? CachedNetworkImage(
                              imageUrl: book!.imgUrl,
                              errorWidget: (context, url, error) => Image.asset(
                                'assets/images/thumb.jpg',
                                fit: BoxFit.cover,
                              ),
                              fit: BoxFit.cover,
                              height: 45,
                              width: 25,
                            )
                          : const SizedBox.shrink(),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${book?.title}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            book != null
                                ? (book!.categories.length > 0
                                    ? 'by ${book?.authors.first.name}'
                                    : 'Anonymous')
                                : '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).accentColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Spacer(),
                CustomButton(
                  width: 45,
                  height: 45,
                  iconSize: 25,
                  radius: 8,
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  iconData: Icons.search_rounded,
                  tooltips: 'Search',
                  hasShadow: false,
                  hasBorder: true,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  width: 45,
                  height: 45,
                  iconSize: 25,
                  radius: 8,
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  iconData: Icons.fullscreen_rounded,
                  tooltips: 'Fullscreen',
                  hasShadow: false,
                  hasBorder: true,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  width: 45,
                  height: 45,
                  iconSize: 25,
                  radius: 8,
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  iconData: Icons.text_fields_rounded,
                  tooltips: 'Font size',
                  hasShadow: false,
                  hasBorder: true,
                ),
                const SizedBox(width: 10),
                CustomButton(
                  width: 45,
                  height: 45,
                  iconSize: 25,
                  radius: 8,
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  iconData: Icons.more_vert_rounded,
                  tooltips: 'more settings',
                  hasShadow: false,
                  hasBorder: true,
                ),
                const SizedBox(width: 10),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
