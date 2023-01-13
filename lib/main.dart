import './screens/viewSpecified.dart';
import './screens/viewPlayer.dart';

import './screens/fantasy.dart';
import './screens/homePage.dart';
import './screens/news.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
        canvasColor: Colors.purple.shade50,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => HomePage(),
        Fantasy.routName: (context) => Fantasy(),
        News.routName: (context) => News(),
        ViewPlayer.nameRout: (context) => ViewPlayer(),
        ViewSpecified.nameRout: (context) => ViewSpecified(),
      },
    );
  }
}

class myHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
