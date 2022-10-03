import 'package:book_store/Utils/header.dart';
import 'package:book_store/Utils/web_platform.dart';
import 'package:book_store/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'Utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iLibrary',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      scrollBehavior: const CustomScrollBehaviour(),
      home: const MyHomePage(title: 'Home Page'),
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
    return const Scaffold(
      backgroundColor: Color(0xffF2F5F7),
      body: WebPlatform(
        header: Header(),
        body: HomePage(),
      ),
    );
  }
}
