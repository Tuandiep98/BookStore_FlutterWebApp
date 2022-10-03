import 'package:flutter/material.dart';

class TabBarElement extends StatelessWidget {
  const TabBarElement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        isScrollable: true,
        indicatorPadding: EdgeInsets.only(bottom: -8),
        indicatorSize: TabBarIndicatorSize.label,
        mouseCursor: MouseCursor.defer,
        tabs: [
          Tab(
            icon: Text(
              'All genres',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Business',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Science',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Fiction',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Philosophy',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
          Tab(
            icon: Text(
              'Biography',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
