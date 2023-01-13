import '../models/new.dart';

import '../data.dart';

import '../widgets/listNews.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  static const String routName = "news";
  @override
  List<New> listNew = dataNews;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListNews(listNew[index].title, listNew[index].image,
              listNew[index].supTitle);
        },
        itemCount: listNew.length,
      ),
    );
  }
}
