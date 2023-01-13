import 'package:advance_app/data.dart';
import 'package:advance_app/models/banck.dart';

import '../screens/news.dart';

import '../screens/fantasy.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexPage = 0;

  void getIndexPage(int index) {
    setState(() {
      indexPage = index;
      if (indexPage == 1) {
        Bank.totalValue = 45.0;
        for (int i = 0; i < dataPlayers.length; i++) {
          dataPlayers[i].unselect = true;
        }
      }
    });
  }

  List<Map<String, Object>> page = [
    {"page": News(), "title": "Create Your Team "},
    {"page": Fantasy(), "title": "Breaking News"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(page[indexPage]["title"] as String),
      // ),
      body: page[indexPage]["page"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.white,
        currentIndex: indexPage,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        onTap: getIndexPage,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.fiber_new_sharp), label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer_outlined), label: "Fantasy"),
        ],
      ),
    );
  }
}
