import 'package:book_store/core/dto/author/author_dto.dart';
import 'package:flutter/material.dart';

class AuthorActivityElement extends StatefulWidget {
  final List<AuthorDto> authors;
  final String description;
  final double size;
  final double thickness;
  final double fontSize;
  final double paddingLeft;
  final bool isShimmer;
  final double maxWidth;
  const AuthorActivityElement({
    Key? key,
    required this.authors,
    this.description = 'Description',
    this.size = 24,
    this.thickness = 2,
    this.fontSize = 13,
    this.paddingLeft = 15,
    this.isShimmer = false,
    this.maxWidth = 340,
  }) : super(key: key);

  @override
  State<AuthorActivityElement> createState() => _AuthorActivityElementState();
}

class _AuthorActivityElementState extends State<AuthorActivityElement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: widget.paddingLeft),
      constraints: BoxConstraints(
        maxHeight: widget.size * 1.5,
        maxWidth: widget.maxWidth,
      ),
      child: Row(
        children: [
          SizedBox(
            width: widget.size * 2.5,
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: widget.authors
                  .map((e) => Positioned(
                        left: widget.authors.indexOf(e) * (widget.size * 0.6),
                        child: Container(
                          width: widget.size,
                          height: widget.size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[300],
                            border: Border.all(
                              color: Colors.white,
                              width: widget.thickness,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Image.asset(
                              e.imgUrl,
                              height: 40,
                              width: 40,
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          ),
          const SizedBox(width: 5),
          Divider(),
          Expanded(
            child: SizedBox(
              width: 300,
              child: widget.isShimmer
                  ? Container(
                      width: 80,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(12),
                      ),
                    )
                  : Text(
                      widget.authors.length > 0
                          ? '${widget.authors.first.name}' +
                              (widget.authors.length > 1
                                  ? ' & ${widget.authors.length - 1} people'
                                  : '') +
                              ' likes this'
                          : '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: widget.fontSize,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
