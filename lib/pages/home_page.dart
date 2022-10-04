import 'package:book_store/Utils/footer.dart';
import 'package:book_store/elements/shimmers/book_shimmer.dart';
import 'package:book_store/elements/tab_body_element.dart';
import 'package:book_store/elements/trending_element.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Utils/platform_utils.dart';
import '../core/bloc/book_bloc/book_bloc.dart';
import '../elements/book_element.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _controller = ScrollController();
  final CarouselController _controllerOfCarousel = CarouselController();
  String activeTab = 'All genres';

  @override
  void initState() {
    context.read<BookBloc>().add(BookStarted());
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: PlatformUtils.isDevice() ? 130 : 100),
        width: double.infinity,
        height: MediaQuery.of(context).size.height +
            (PlatformUtils.isDevice() ? 240 * 7 + 200 : 500),
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
                              PlatformUtils.isDevice() ? 0.9 : 0.4,
                          height: MediaQuery.of(context).size.height / 3.25,
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
                            .toList(),
                        options: CarouselOptions(
                          // enlargeCenterPage: false,
                          viewportFraction:
                              PlatformUtils.isDevice() ? 0.9 : 0.4,
                          height: MediaQuery.of(context).size.height / 3.25,
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
                      onTap: () async => await _controllerOfCarousel.nextPage(),
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
                    TabBar(
                      isScrollable: true,
                      indicatorPadding: const EdgeInsets.only(bottom: -8),
                      indicatorSize: TabBarIndicatorSize.label,
                      mouseCursor: MouseCursor.defer,
                      onTap: (int index) {
                        switch (index) {
                          case 0:
                            activeTab = 'Trending';
                            break;
                          case 1:
                            activeTab = 'All genres';
                            break;
                          case 2:
                            activeTab = 'Business';
                            break;
                          case 3:
                            activeTab = 'Science';
                            break;
                          case 4:
                            activeTab = 'Fiction';
                            break;
                          case 5:
                            activeTab = 'Philosophy';
                            break;
                          case 6:
                            activeTab = 'Biography';
                            break;
                          default:
                            break;
                        }
                        setState(() {});
                      },
                      tabs: [
                        PlatformUtils.isDevice()
                            ? Tab(
                                icon: Text(
                                  'Trending',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 13,
                                    color: activeTab == 'Trending'
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                        Tab(
                          icon: Text(
                            'All genres',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'All genres'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Business',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'Business'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Science',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'Science'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Fiction',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'Fiction'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Philosophy',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'Philosophy'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                        Tab(
                          icon: Text(
                            'Biography',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: activeTab == 'Biography'
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
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
                    PlatformUtils.isDevice()
                        ? const SizedBox.shrink()
                        : const TrendingElement(),
                    TabBody(controller: _controller),
                  ],
                ),
              ),
              const Footer(),
            ],
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
