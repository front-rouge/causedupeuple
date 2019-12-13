import 'package:causedupeuple/models/article_model.dart';
import 'package:causedupeuple/widgets/article_header_image.dart';
import 'package:causedupeuple/widgets/article_share_buttons.dart';
import 'package:causedupeuple/widgets/article_time_posted.dart';
import 'package:flutter/material.dart';

class ArticlePreviewCard extends StatelessWidget {
  final ArticleModel article;

  ArticlePreviewCard({Key key, @required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: InkWell(
        onTap: () { /* TODO */ },
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    article.summary,
                    style: Theme.of(context).textTheme.body1,
                    textAlign: TextAlign.justify
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ArticleTimePosted(
                        date: article.date,
                      ),
                      Expanded(
                        child: Container()
                      ),
                      ArticleShareButtons(
                        title: article.title,
                        url: article.url,
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}