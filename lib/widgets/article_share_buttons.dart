import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

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
            final snackBar = SnackBar(
              content: Text("Copié ! :)"),
              duration: Duration(microseconds: 500),
            );
            Clipboard.setData(ClipboardData(text: url));
            Scaffold.of(context).showSnackBar(snackBar);
          },
        ),
        IconButton(
          icon: Icon(Icons.share),
          color: Colors.grey,
          tooltip: "Partager l'article",
          onPressed: () {
            Share.share("$title $url", subject: "Cause Du Peuple: $title");
          },
        )
      ],
    );
  }
}