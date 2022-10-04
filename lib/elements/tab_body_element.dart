import 'package:book_store/Utils/platform_utils.dart';
import 'package:book_store/elements/trending_element.dart';
import 'package:flutter/material.dart';

import '../Utils/scroll_view.dart';
import 'book_element_reverse.dart';

class TabBody extends StatelessWidget {
  final ScrollController controller;
  const TabBody({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        children: [
          PlatformUtils.isDevice()
              ? const TrendingElement()
              : const SizedBox.shrink(),
          buildScrollingView(
            controller,
            const <Widget>[
              BookElementReverse(
                  authors: [0, 1, 2],
                  description: 'Kimberly Jones and 2 other friends like this'),
              BookElementReverse(
                  authors: [1], description: 'Kimberly Jones like this'),
              BookElementReverse(
                  authors: [0, 1, 2],
                  description: 'Kimberly Jones and 2 other friends like this'),
              BookElementReverse(authors: []),
              BookElementReverse(
                  authors: [1, 2],
                  description: 'Kimberly Jones, John Doe like this'),
              BookElementReverse(authors: []),
              BookElementReverse(authors: []),
            ],
          ),
          const Center(child: Text('No data to display.')),
          const Center(child: Text('No data to display.')),
          const Center(child: Text('No data to display.')),
          const Center(child: Text('No data to display.')),
          const Center(child: Text('No data to display.')),
        ],
      ),
    );
  }
}
