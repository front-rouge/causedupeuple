import 'package:causedupeuple/utils/fetch_news.dart';
import 'package:causedupeuple/widgets/new_card.dart';
import 'package:flutter_pagewise/flutter_pagewise.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final Text title;
  final int categoryId;

  NewsScreen({Key key, @required this.categoryId, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Center(
        child: PagewiseListView(
          pageSize: 10,
          itemBuilder: (context, entry, index) {
            return NewCard(item: entry);
  },
          pageFuture: (pageIndex) {
            return fetchNews(this.categoryId, pageIndex + 1);
          },
        )
        /*ListView.builder(
          itemCount: _news.length,
          itemBuilder: (BuildContext context, int index) {
            print(_news.length);
            if (_news.length == 0) {
              return CircularProgressIndicator();
            }
            return NewCard(item: _news[index]);
          },
        )*/
    );
  }
}
