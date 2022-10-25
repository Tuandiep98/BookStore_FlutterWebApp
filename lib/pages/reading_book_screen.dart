import 'package:book_store/main.dart';
import 'package:flutter/material.dart';

class ReadingBookScreen extends StatefulWidget {
  final String bookId;
  const ReadingBookScreen({
    super.key,
    required this.bookId,
  });

  @override
  State<ReadingBookScreen> createState() => _ReadingBookScreenState();
}

class _ReadingBookScreenState extends State<ReadingBookScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Text('this is reading book screen'),
      ),
    );
  }
}
