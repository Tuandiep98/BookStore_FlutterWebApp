import 'package:book_store/pages/home_page.dart';
import 'package:book_store/pages/reading_book_screen.dart';
import 'package:book_store/utils/header_2.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../main.dart';

final ValueKey<String> scaffoldKey = const ValueKey<String>('App scaffold');

class Routerconfiguration {
  final GoRouter router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) => BaseScreen(
          body: HomePage(),
        ),
        routes: <GoRoute>[
          GoRoute(
            name: 'read-book',
            path: 'read-book/:bookId',
            pageBuilder: (BuildContext context, GoRouterState state) =>
                FadeTransitionPage(
              key: scaffoldKey,
              child: BaseScreen(
                header: Header2(
                  bookId: state.params['bookId'] ?? '',
                ),
                body: ReadingBookScreen(
                  bookId: state.params['bookId'] ?? '',
                ),
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

/// A page that fades in an out.
class FadeTransitionPage extends CustomTransitionPage<void> {
  /// Creates a [FadeTransitionPage].
  FadeTransitionPage({
    required LocalKey key,
    required Widget child,
  }) : super(
            key: key,
            transitionsBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                    Widget child) =>
                FadeTransition(
                  opacity: animation.drive(_curveTween),
                  child: child,
                ),
            child: child);

  static final CurveTween _curveTween = CurveTween(curve: Curves.easeIn);
}
