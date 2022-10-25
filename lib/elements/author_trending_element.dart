import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:flutter/material.dart';

class AuthorTrendingElement extends StatefulWidget {
  final AuthorDto author;
  final String description;
  final double size;
  final double thickness;
  final double fontSize;
  final double paddingLeft;
  const AuthorTrendingElement({
    Key? key,
    required this.author,
    this.description = 'Description',
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.paddingLeft = 15,
  }) : super(key: key);

  @override
  State<AuthorTrendingElement> createState() => _AuthorTrendingElementState();
}

class _AuthorTrendingElementState extends State<AuthorTrendingElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.paddingLeft, top: 10, bottom: 10),
      constraints: const BoxConstraints(
        maxHeight: 65,
        maxWidth: 460,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            height: 75,
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                widget.author.imgUrl,
                scale: 1.2,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SizedBox(
              width: 380,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.author.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: widget.fontSize,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.author.bio,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic,
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
