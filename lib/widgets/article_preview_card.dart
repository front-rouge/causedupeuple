import 'package:causedupeuple/widgets/article_header_image.dart';
import 'package:causedupeuple/widgets/article_share_buttons.dart';
import 'package:causedupeuple/widgets/article_time_posted.dart';
import 'package:flutter/material.dart';

class ArticlePreviewCard extends StatelessWidget {

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
                "TITLE",
                style: Theme.of(context).textTheme.title,
              ),
            ),
            ArticleHeaderImage(
              srcUrl: "http://via.placeholder.com/640x360",
              srcWidth: 640,
              srcHeight: 360,
            ),
            Padding(
              padding: EdgeInsets.only(left: 6.0, right: 6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "lorem ipsum sit amet",
                    style: Theme.of(context).textTheme.body1,
                  ),
                  Divider(),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ArticleTimePosted(
                        date: DateTime.now(),
                      ),
                      Expanded(
                        child: Container()
                      ),
                      ArticleShareButtons(
                        title: "",
                        url: "",
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