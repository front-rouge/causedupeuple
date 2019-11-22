import 'package:flutter/material.dart';

class ArticleShareButtons extends StatelessWidget {
  
  final String title;
  final String url;

  ArticleShareButtons({Key key, @required this.title, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.content_copy),
          color: Colors.grey,
          tooltip: "Copier le lien de l'article",
          onPressed: () {
            /* TODO */
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.grey,
          tooltip: "Partager l'article",
          onPressed: () { /* TODO */ },
        )
      ],
    );
  }
}