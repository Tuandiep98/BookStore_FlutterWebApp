import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      width: MediaQuery.of(context).size.width / 1.5,
      height: MediaQuery.of(context).size.height - 100,
      constraints: BoxConstraints(
        maxHeight: 600,
        maxWidth: 1200,
      ),
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 1.5,
            width: (MediaQuery.of(context).size.height - 100) / 1.75,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            constraints: BoxConstraints(
              maxHeight: 600,
              maxWidth: 340,
            ),
            child: CachedNetworkImage(
              imageUrl: 'widget.book.imgUrl',
              errorWidget: (context, url, error) => Image.asset(
                'assets/images/thumb.jpg',
                fit: BoxFit.cover,
              ),
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.book.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.book.authors.length > 0
                      ? 'by ${widget.book.authors.first.name}'
                      : 'Anonymous',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                    Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                    Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                    Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                    Icon(Icons.star_rounded, size: 35, color: Colors.grey),
                  ],
                ),
                const SizedBox(height: 25),
                const Text(
                  'Louisa Clark is no longer hust an ordinary girl\nliving an ordinary life. After the transaformative\nsix months spent.',
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
                const Divider(),
                AuthorActivityElement(
                  authors: [0, 1, 2],
                  description: '3 peoples like this.',
                  paddingLeft: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
