import 'dart:math';

import 'package:book_store/core/bloc/home_page_trending_bloc/home_page_trending_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Utils/scroll_behavior.dart';
import 'author_trending_element.dart';
import 'book_activity_element.dart';
import 'shimmers/author_trending_shimmer.dart';
import 'shimmers/book_trending_shimmer.dart';

class TrendingElement extends StatefulWidget {
  const TrendingElement({Key? key}) : super(key: key);

  @override
  State<TrendingElement> createState() => _TrendingElementState();
}

class _TrendingElementState extends State<TrendingElement> {
  final _random = new Random();

  @override
  void initState() {
    context.read<HomePageTrendingBloc>().add(HomePageTrendingStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 5.2,
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: SingleChildScrollView(
          child: BlocBuilder<HomePageTrendingBloc, HomePageTrendingState>(
              builder: (context, state) {
            if (state is HomePageTrendingInitial) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  AuthorTrendingShimmer(),
                  AuthorTrendingShimmer(),
                  AuthorTrendingShimmer(),
                  AuthorTrendingShimmer(),
                  AuthorTrendingShimmer(),
                  const SizedBox(height: 20),
                  BookActivityShimmer(size: 50, top: '1'),
                  BookActivityShimmer(size: 50, top: '2'),
                  BookActivityShimmer(size: 50, top: '3'),
                  BookActivityShimmer(size: 50, top: '4'),
                  BookActivityShimmer(size: 50, top: '5'),
                ],
              );
            }
            if (state is HomePageTrendingLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                ]
                  ..addAll(state.authors
                      .map((e) => AuthorTrendingElement(
                            author: state
                                .authors[_random.nextInt(state.authors.length)],
                            description: 'Angie Cruz',
                            thickness: 0,
                            size: 32,
                            fontSize: 14,
                          ))
                      .toList())
                  ..add(const SizedBox(height: 20))
                  ..addAll(state.books
                      .map((e) => BookActivityElement(
                            book: e,
                            author: state
                                .authors[_random.nextInt(state.authors.length)],
                            fontSize: 14,
                            size: 50,
                            top: (state.books.indexOf(e) + 1).toString(),
                          ))
                      .toList()),
              );
            }
            return const Text('Something went wrong!');
          }),
        ),
      ),
    );
  }
}
