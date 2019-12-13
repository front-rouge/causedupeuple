import 'package:causedupeuple/models/article_model.dart';
import 'package:causedupeuple/widgets/article_share_buttons.dart';
import 'package:causedupeuple/widgets/article_time_posted.dart';
import 'package:flutter/material.dart';
import 'package:causedupeuple/widgets/article_header_image.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:html/dom.dart' as dom;

class DetailScreen extends StatelessWidget {
  final ArticleModel article;

  DetailScreen({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(1.0),
        child: Card(
          elevation: 10,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  article.title,
                  style: Theme.of(context).textTheme.title,
                ),
              ),
              if (article.imgUrl != null)
                ArticleHeaderImage(
                  srcUrl: article.imgUrl,
                  srcWidth: article.imgWidth,
                  srcHeight: article.imgHeight,
                ),
              Padding(
                padding: EdgeInsets.only(left: 6.0, right: 6.0),
                child: Column(
                  children: <Widget>[
                    Divider(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ArticleTimePosted(date: article.date),
                        Expanded(child: Container(),),
                        ArticleShareButtons(title: article.title, url: article.url)
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
              Html(
                data: article.content,
                onLinkTap: (url) async {
                  if (await canLaunch(url)) {
                    await launch(url);
                  }
                },
                padding: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 6.0),
                linkStyle: TextStyle(color: Theme.of(context).accentColor),
                customTextAlign: (dom.Node node) {
                  if (node is dom.Element) {
                    switch (node.localName) {
                      case "p":
                        return TextAlign.justify;
                    }
                  }
                  return null;
                },
              )
            ],
          ),
        )
      ),
    );
  }

}