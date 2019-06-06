import 'package:causedupeuple/utils/fetch_news.dart';
import 'package:causedupeuple/utils/new_item.dart';
import 'package:causedupeuple/widgets/new_card.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  final int categoryId;
  final news = fetchNews();

  NewsScreen({Key key, @required this.categoryId}) : super(key: key);
  @override
  Widget build(BuildContext ctx) {
    return Center(
        child: FutureBuilder<List<NewItem>>(
      future: news,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var datas = snapshot.data;
          if (this.categoryId > 0) {
            datas = datas.where((item) => item.categories.contains(this.categoryId)).toList();
          }
          var widgets = List<Widget>();
          for (var item in datas) {
            widgets.add(NewCard(item: item));
          }
          return ListView(children: widgets);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }

        return CircularProgressIndicator();
      },
    ));
  }
}
