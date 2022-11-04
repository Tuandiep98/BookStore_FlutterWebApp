import 'package:book_store/core/dto/book/book_dto.dart';
import 'package:book_store/utils/platform_utils.dart';
import 'package:flutter/material.dart';

class BookRatingWidget extends StatelessWidget {
  final BookDto book;
  const BookRatingWidget({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width *
          (PlatformUtils.isDevice(context) ? 0.9 : 0.3),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${book.rate} ratings',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.star_rounded, size: 25, color: Colors.amber),
              Icon(Icons.star_rounded, size: 25, color: Colors.amber),
              Icon(Icons.star_rounded, size: 25, color: Colors.amber),
              Icon(Icons.star_rounded, size: 25, color: Colors.amber),
              Icon(Icons.star_rounded, size: 25, color: Colors.grey),
              const SizedBox(width: 20),
              Text(
                '4 out of 5',
                style: TextStyle(
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '5 star',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: PlatformUtils.isDevice(context)
                    ? (MediaQuery.of(context).size.width * 0.8)
                    : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '4 star',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: PlatformUtils.isDevice(context)
                    ? (MediaQuery.of(context).size.width * 0.8)
                    : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '3 star',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: PlatformUtils.isDevice(context)
                    ? (MediaQuery.of(context).size.width * 0.8)
                    : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '2 star',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: PlatformUtils.isDevice(context)
                    ? (MediaQuery.of(context).size.width * 0.8)
                    : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Text(
                '1 star',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 25,
                width: PlatformUtils.isDevice(context)
                    ? (MediaQuery.of(context).size.width * 0.8)
                    : 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.grey[200],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
