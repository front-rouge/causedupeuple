import 'package:causedupeuple/widgets/article_preview_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Image.asset(
              "assets/logo.png",
              fit: BoxFit.contain,
              height: 32,
            ),
            Container(
              padding: EdgeInsets.all(8.0),
              child: Text('La Cause Du Peuple'),
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
          ArticlePreviewCard(),
        ],
      ),
    );
  }

}