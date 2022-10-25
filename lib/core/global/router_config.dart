import 'package:book_store/pages/home_page.dart';
import 'package:book_store/pages/reading_book_screen.dart';
import 'package:book_store/utils/header_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';

class Routerconfiguration {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            BaseScreen(body: HomePage()),
        routes: <GoRoute>[
          GoRoute(
            name: 'read-book',
            path: 'read-book/:bookId',
            builder: (BuildContext context, GoRouterState state) => BaseScreen(
              header: Header2(
                bookId: state.params['bookId'] ?? '',
              ),
              body: ReadingBookScreen(
                bookId: state.params['bookId'] ?? '',
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
