import 'package:flutter/material.dart';

class CategoryOutlinedElement extends StatelessWidget {
  final String categoryName;
  const CategoryOutlinedElement({
    Key? key,
    this.categoryName = '[category-name]',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.blue,
        ),
      ),
      child: Center(child: Text(categoryName)),
    );
  }
}
