// import 'package:flutter/material.dart';

// import '../Utils/scroll_view.dart';
// import 'book_element_reverse.dart';

// class TabBarBody extends StatelessWidget {
//   final ScrollController controller;
//   const TabBarBody({Key? key, required this.controller}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: TabBarView(
//         children: [
//           buildScrollingView(
//             controller,
//             const <Widget>[
//               BookElementReverse(
//                   authors: [0, 1, 2],
//                   description: 'Kimberly Jones and 2 other friends like this'),
//               BookElementReverse(
//                   authors: [0], description: 'Kimberly Jones like this'),
//               BookElementReverse(
//                   authors: [0, 1, 2],
//                   description: 'Kimberly Jones and 2 other friends like this'),
//               BookElementReverse(authors: []),
//               BookElementReverse(
//                   authors: [0, 1],
//                   description: 'Kimberly Jones, John Doe like this'),
//               BookElementReverse(authors: []),
//               BookElementReverse(authors: []),
//             ],
//           ),
//           Center(child: Text('No data to display.')),
//           Center(child: Text('No data to display.')),
//           Center(child: Text('No data to display.')),
//           Center(child: Text('No data to display.')),
//           Center(child: Text('No data to display.')),
//         ],
//       ),
//     );
//   }
// }
