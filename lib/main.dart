import 'package:book_store/core/bloc/book_reader_bloc/book_reader_bloc.dart';
import 'package:book_store/utils/header.dart';
import 'package:book_store/utils/web_platform.dart';
import 'package:book_store/core/bloc/home_page_trending_bloc/home_page_trending_bloc.dart';
import 'package:book_store/core/global/router_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'utils/my_custom_scroll_behavior.dart';
import 'core/bloc/book_bloc/book_bloc.dart';
import 'core/bloc/setting_bloc/setting_bloc.dart';
import 'core/global/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyARc8y--XsvZevcf9iTq_jglQODFwg1Uc0",
      appId: "1:1053757662020:web:267127d1cffec92fcfad11",
      messagingSenderId: "1053757662020",
      projectId: "ilibrary-flutterwebapp",
    ),
  );
  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => BookBloc()),
        BlocProvider(create: (_) => HomePageTrendingBloc()),
        BlocProvider(create: (_) => SettingBloc()..add(ThemeStarted())),
        BlocProvider(create: (_) => BookReaderBloc()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          var _themeData = ThemeData(
            primarySwatch: Colors.blue,
          );
          if (state is ThemeLoaded || state is ThemeLoadedWithAccount) {
            _themeData = state.themeData;
          }
          return MaterialApp.router(
            title: 'iLibrary',
            theme: _themeData,
            scrollBehavior: MyCustomScrollBehavior(),
            routerConfig: Routerconfiguration().router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

class BaseScreen extends StatefulWidget {
  final Widget? header;
  final Widget body;
  BaseScreen({Key? key, required this.body, this.header}) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: WebPlatform(
          header: widget.header != null ? widget.header! : Header(),
          body: Container(
            padding: const EdgeInsets.only(top: 80),
            child: widget.body,
          ),
        ),
      ),
    );
  }
}
