import 'package:book_store/utils/footer.dart';
import 'package:book_store/elements/shimmers/book_reverse_shimmer.dart';
import 'package:book_store/elements/shimmers/book_shimmer.dart';
import 'package:book_store/elements/trending_element.dart';
import 'package:book_store/utils/scroll_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import '../utils/platform_utils.dart';
import '../core/bloc/book_bloc/book_bloc.dart';
import '../core/bloc/setting_bloc/setting_bloc.dart';
import '../elements/book_element.dart';
import '../elements/book_element_reverse.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final ScrollController _shimmerController = ScrollController();
  final CarouselController _controllerOfCarousel = CarouselController();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  String activeTab = 'All genres';

  @override
  void initState() {
    context.read<BookBloc>().add(BookStarted());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _shimmerController.dispose();
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() {
    // monitor network fetch
    context.read<BookBloc>().add(BookReload());
    context.read<BookBloc>().add(BookStarted());
    // await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      header: ClassicHeader(),
      controller: _refreshController,
      onRefresh: _onRefresh,
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height +
              (PlatformUtils.isDevice(context) ? 240 * 7 + 200 : 500),
          child: DefaultTabController(
            length: 7,
            initialIndex: 1,
            child: Column(
              children: [
                Stack(
                  children: [
                    BlocBuilder<BookBloc, BookState>(builder: (context, state) {
                      if (state is BookInitial) {
                        return CarouselSlider(
                          carouselController: _controllerOfCarousel,
                          items: [
                            BookShimmer(),
                            BookShimmer(),
                            BookShimmer(),
                            BookShimmer(),
                            BookShimmer(),
                            BookShimmer(),
                          ],
                          options: CarouselOptions(
                            // enlargeCenterPage: false,
                            viewportFraction:
                                PlatformUtils.isDevice(context) ? 0.9 : 0.4,
                            height: 300,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 2200),
                          ),
                        );
                      }
                      if (state is BookLoaded) {
                        return CarouselSlider(
                          carouselController: _controllerOfCarousel,
                          items: state.books
                              .map((e) => BookElement(book: e))
                              .take(10)
                              .toList(),
                          options: CarouselOptions(
                            // enlargeCenterPage: false,
                            viewportFraction:
                                PlatformUtils.isDevice(context) ? 0.9 : 0.4,
                            height: 300,
                            enableInfiniteScroll: true,
                            autoPlay: true,
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 2200),
                          ),
                        );
                      }
                      return const Text('Something went wrong!');
                    }),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: InkWell(
                        child: _buildButton(isForward: true),
                        onTap: () async =>
                            await _controllerOfCarousel.nextPage(),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 0,
                      child: InkWell(
                        child: _buildButton(),
                        onTap: () async =>
                            await _controllerOfCarousel.previousPage(),
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Wrap(
                    children: [
                      const SizedBox(width: 20),
                      BlocBuilder<BookBloc, BookState>(
                          builder: (context, state) {
                        return TabBar(
                          isScrollable: true,
                          indicatorPadding: const EdgeInsets.only(bottom: -8),
                          indicatorSize: TabBarIndicatorSize.label,
                          mouseCursor: MouseCursor.defer,
                          tabs: [
                            PlatformUtils.isDevice(context)
                                ? Tab(
                                    icon: Text(
                                      'Trending',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13,
                                        color: context
                                            .read<SettingBloc>()
                                            .getTheme()
                                            .accentColor,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ]..addAll((state is BookLoaded)
                              ? state.categories
                                  .map((e) => Tab(
                                        icon: Text(
                                          e.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13,
                                            color: context
                                                .read<SettingBloc>()
                                                .getTheme()
                                                .accentColor,
                                          ),
                                        ),
                                      ))
                                  .toList()
                              : [
                                  Tab(
                                    icon: Container(
                                      width: 40,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Container(
                                      width: 80,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Container(
                                      width: 40,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Container(
                                      width: 80,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Container(
                                      width: 40,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    icon: Container(
                                      width: 80,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                ]),
                        );
                      }),
                      const SizedBox(width: 20),
                    ],
                  ),
                ),
                const Divider(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PlatformUtils.isDevice(context)
                          ? const SizedBox.shrink()
                          : TrendingElement(),
                      BlocBuilder<BookBloc, BookState>(
                          builder: (context, state) {
                        if (state is BookInitial) {
                          return Expanded(
                            child: Container(
                              child: buildScrollingView(
                                _shimmerController,
                                const [
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                  BookElementReverseShimmer(),
                                ],
                              ),
                            ),
                          );
                        }
                        if (state is BookLoaded) {
                          return Expanded(
                            child: TabBarView(
                              children: [
                                PlatformUtils.isDevice(context)
                                    ? TrendingElement()
                                    : const SizedBox.shrink(),
                                buildScrollingView(
                                  _controller,
                                  <Widget>[]..addAll(state.books
                                      .map((e) => BookElementReverse(
                                            book: e,
                                          ))
                                      .toList()
                                      .take(10)),
                                ),
                                const Center(
                                    child: Text('No data to display.')),
                                const Center(
                                    child: Text('No data to display.')),
                                const Center(
                                    child: Text('No data to display.')),
                                const Center(
                                    child: Text('No data to display.')),
                                const Center(
                                    child: Text('No data to display.')),
                              ],
                            ),
                          );
                        }
                        return const SizedBox.shrink();
                      }),
                    ],
                  ),
                ),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildButton({bool isForward = false}) {
  return SizedBox(
    width: 60,
    height: 220,
    child: Center(
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5),
        ),
        child: Center(
          child: Icon(
            isForward
                ? Icons.arrow_forward_ios_rounded
                : Icons.arrow_back_ios_rounded,
            size: 20,
            color: Colors.grey.shade400,
          ),
        ),
      ),
    ),
  );
}
