import 'package:flutter/material.dart';
import 'package:flutter_improved_scrolling/flutter_improved_scrolling.dart';

import 'scroll_behavior.dart';

Widget buildScrollingView(ScrollController controller, List<Widget> children,
    {bool useSystemCursor = false, Axis axis = Axis.vertical}) {
  return ImprovedScrolling(
    scrollController: controller,
    // onScroll: (scrollOffset) => debugPrint(
    //   'Scroll offset: $scrollOffset',
    // ),
    // onMMBScrollStateChanged: (scrolling) => debugPrint(
    //   'Is scrolling: $scrolling',
    // ),
    // onMMBScrollCursorPositionUpdate: (localCursorOffset, scrollActivity) =>
    //     debugPrint(
    //   'Cursor position: $localCursorOffset\n'
    //   'Scroll activity: $scrollActivity',
    // ),
    enableMMBScrolling: true,
    enableKeyboardScrolling: true,
    enableCustomMouseWheelScrolling: true,
    mmbScrollConfig: MMBScrollConfig(
      customScrollCursor:
          useSystemCursor ? null : const DefaultCustomScrollCursor(),
    ),
    keyboardScrollConfig: KeyboardScrollConfig(
      homeScrollDurationBuilder: (currentScrollOffset, minScrollOffset) {
        return const Duration(milliseconds: 100);
      },
      endScrollDurationBuilder: (currentScrollOffset, maxScrollOffset) {
        return const Duration(milliseconds: 2000);
      },
    ),
    customMouseWheelScrollConfig: const CustomMouseWheelScrollConfig(
      scrollAmountMultiplier: 4.0,
      scrollDuration: Duration(milliseconds: 250),
    ),
    child: ScrollConfiguration(
      behavior: const CustomScrollBehaviour(),
      child: GridView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: axis,
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 600.0,
          mainAxisExtent: 300.0,
        ),
        children: buildScrollableItemList(axis, children),
      ),
    ),
  );
}

List<Widget> buildScrollableItemList(Axis axis, List<Widget> children) {
  // final isVertical = axis == Axis.vertical;
  // final Size itemsSize;
  // if (isVertical) {
  //   itemsSize = const Size(700.0, 300.0);
  // } else {
  //   itemsSize = const Size(300.0, 500.0);
  // }

  return children;
}

Widget buildScrollableItem({
  required Size size,
  required Widget child,
}) {
  return GridTile(
    child: Container(
      margin: const EdgeInsets.only(
        top: 24.0,
        left: 24.0,
        right: 24.0,
      ),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.black.withAlpha(10), width: 2.0),
        color: Colors.white,
      ),
      width: size.width,
      height: size.height,
      child: child,
    ),
  );
}
