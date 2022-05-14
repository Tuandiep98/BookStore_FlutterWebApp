import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'Utils/scroll_behavior.dart';
import 'Utils/scroll_view.dart';
import 'elements/author_activity_element.dart';
import 'elements/book_activity_element.dart';
import 'elements/book_element.dart';
import 'elements/book_element_reverse.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: const CustomScrollBehaviour(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  final CarouselController _controllerOfCarousel = CarouselController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F5F7),
      body: DefaultTabController(
        length: 6,
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: _controllerOfCarousel,
                  items: const [
                    BookElement(),
                    BookElement(),
                    BookElement(),
                    BookElement(),
                    BookElement(),
                    BookElement(),
                  ],
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    height: MediaQuery.of(context).size.height / 3.25,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 2200),
                  ),
                ),
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
              child: SizedBox(
                width: 700,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    SizedBox(width: 20),
                    Text('Popular by Genre'),
                    Spacer(),
                    TabBar(
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
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),
            const Divider(),
            Expanded(
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 6.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        SizedBox(height: 30),
                        AuthorActivityElement(
                          authors: [1],
                          description: 'Angie Cruz',
                          thickness: 0,
                          size: 32,
                          fontSize: 14,
                        ),
                        SizedBox(height: 10),
                        AuthorActivityElement(
                          authors: [1],
                          description: 'James Lasdun',
                          thickness: 0,
                          size: 32,
                          fontSize: 14,
                        ),
                        SizedBox(height: 10),
                        AuthorActivityElement(
                          authors: [1],
                          description: 'Kimberly Jones',
                          thickness: 0,
                          size: 32,
                          fontSize: 14,
                        ),
                        SizedBox(height: 10),
                        AuthorActivityElement(
                          authors: [1],
                          description: 'Lucy Parker',
                          thickness: 0,
                          size: 32,
                          fontSize: 14,
                        ),
                        SizedBox(height: 50),
                        BookActivityElement(
                          books: [0],
                          title: 'Disappearing Earth',
                          fontSize: 14,
                          size: 50,
                          author: 'James Colin',
                          description:
                              'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                          top: '1',
                        ),
                        SizedBox(height: 10),
                        BookActivityElement(
                          books: [0],
                          title: 'Changes Are',
                          fontSize: 14,
                          size: 50,
                          author: 'James Colin',
                          description:
                              'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                          top: '2',
                        ),
                        SizedBox(height: 10),
                        BookActivityElement(
                          books: [0],
                          title: 'Dominicana',
                          fontSize: 14,
                          size: 50,
                          author: 'James Colin',
                          description:
                              'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                          top: '3',
                        ),
                        SizedBox(height: 10),
                        BookActivityElement(
                          books: [0],
                          title: 'Afternoon Of A Faun',
                          fontSize: 14,
                          size: 50,
                          author: 'James Colin',
                          description:
                              'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                          top: '4',
                        ),
                        SizedBox(height: 10),
                        BookActivityElement(
                          books: [0],
                          title: 'The Travellers',
                          fontSize: 14,
                          size: 50,
                          author: 'James Colin',
                          description:
                              'Readers of all ages and walks of life have drawn inspiration and empowerment from Elizabeth Gilbert’s books for years.',
                          top: '5',
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        buildScrollingView(
                          Axis.vertical,
                          _controller,
                          const <Widget>[
                            BookElementReverse(
                                authors: [0, 1, 2],
                                description:
                                    'Kimberly Jones and 2 other friends like this'),
                            BookElementReverse(
                                authors: [0],
                                description: 'Kimberly Jones like this'),
                            BookElementReverse(
                                authors: [0, 1, 2],
                                description:
                                    'Kimberly Jones and 2 other friends like this'),
                            BookElementReverse(authors: []),
                            BookElementReverse(
                                authors: [0, 1],
                                description:
                                    'Kimberly Jones, John Doe like this'),
                            BookElementReverse(authors: []),
                            BookElementReverse(authors: []),
                          ],
                        ),
                        Center(child: Text('No data to display.')),
                        Center(child: Text('No data to display.')),
                        Center(child: Text('No data to display.')),
                        Center(child: Text('No data to display.')),
                        Center(child: Text('No data to display.')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
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
