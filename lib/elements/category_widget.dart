import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  const CategoryWidget({super.key, this.name = '[category-name]'});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
