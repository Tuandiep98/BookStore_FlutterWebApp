import 'package:flutter/material.dart';

import '../Utils/scroll_behavior.dart';
import 'author_activity_element.dart';
import 'book_activity_element.dart';

class TrendingElement extends StatelessWidget {
  const TrendingElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5.2,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 30),
              AuthorActivityElement(
                authors: [1],
                description: 'Angie Cruz',
                thickness: 0,
                size: 32,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              AuthorActivityElement(
                authors: [1],
                description: 'James Lasdun',
                thickness: 0,
                size: 32,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              AuthorActivityElement(
                authors: [1],
                description: 'Kimberly Jones',
                thickness: 0,
                size: 32,
                fontSize: 14,
              ),
              SizedBox(height: 10),
              AuthorActivityElement(
                authors: [1],
                description: 'Lucy Parker',
                thickness: 0,
                size: 32,
                fontSize: 14,
              ),
              SizedBox(height: 50),
              BookActivityElement(
                books: [0],
                title: 'Disappearing Earth',
                fontSize: 14,
                size: 50,
                author: 'James Colin',
                description:
                    'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                top: '1',
              ),
              SizedBox(height: 10),
              BookActivityElement(
                books: [0],
                title: 'Changes Are',
                fontSize: 14,
                size: 50,
                author: 'James Colin',
                description:
                    'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                top: '2',
              ),
              SizedBox(height: 10),
              BookActivityElement(
                books: [0],
                title: 'Dominicana',
                fontSize: 14,
                size: 50,
                author: 'James Colin',
                description:
                    'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                top: '3',
              ),
              SizedBox(height: 10),
              BookActivityElement(
                books: [0],
                title: 'Afternoon Of A Faun',
                fontSize: 14,
                size: 50,
                author: 'James Colin',
                description:
                    'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                top: '4',
              ),
              SizedBox(height: 10),
              BookActivityElement(
                books: [0],
                title: 'The Travellers',
                fontSize: 14,
                size: 50,
                author: 'James Colin',
                description:
                    'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                top: '5',
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
