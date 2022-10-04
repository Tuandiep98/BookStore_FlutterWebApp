import 'package:book_store/Utils/header.dart';
import 'package:book_store/Utils/web_platform.dart';
import 'package:book_store/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Utils/scroll_behavior.dart';
import 'core/bloc/book_bloc/book_bloc.dart';
import 'core/global/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()),
      ],
      child: MaterialApp(
        title: 'iLibrary',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        scrollBehavior: const CustomScrollBehaviour(),
        home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F5F7),
      body: WebPlatform(
        header: Header(),
        body: HomePage(),
      ),
    );
  }
}
