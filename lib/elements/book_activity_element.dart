import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookActivityElement extends StatefulWidget {
  final AuthorDto author;
  final BookDto book;
  final double size;
  final double thickness;
  final double fontSize;
  final String top;
  const BookActivityElement({
    Key? key,
    required this.book,
    required this.author,
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.top = '1',
  }) : super(key: key);

  @override
  State<BookActivityElement> createState() => _BookActivityElementState();
}

class _BookActivityElementState extends State<BookActivityElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15),
      constraints: const BoxConstraints(
        maxHeight: 100,
        maxWidth: 460,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 70,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Positioned(
                  left: 0,
                  child: Text(
                    widget.top,
                    style: const TextStyle(
                      fontSize: 100,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 15,
                  child: Container(
                    width: widget.size,
                    height: widget.size * 1.6,
                    decoration: BoxDecoration(
                      // color:
                      //     Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                      //         .withOpacity(0.95),
                      border: Border.all(
                        color: Colors.white,
                        width: widget.thickness,
                      ),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: widget.book.imgUrl,
                      errorWidget: (context, url, error) => Image.asset(
                        'assets/images/thumb.jpg',
                        fit: BoxFit.cover,
                      ),
                      fit: BoxFit.cover,
                      width: widget.size,
                      height: widget.size * 1.6,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              width: 380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.fontSize,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'by ${widget.author.name}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widget.fontSize - 3,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.book.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: widget.fontSize - 5,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
