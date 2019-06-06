import 'package:causedupeuple/screens/read_screen.dart';
import 'package:causedupeuple/utils/new_item.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewCard extends StatelessWidget {
  final NewItem item;
  final Widget emptyWidget = Container(width: 0, height: 0);

  NewCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(ctx, MaterialPageRoute(builder: (ctx) => ReadScreen(item: this.item)));
        },
        child: Column(
          children: <Widget>[
            item.img != null ? CachedNetworkImage(imageUrl: item.img, fit: BoxFit.fitWidth) : emptyWidget,
            Text(
              item.title,
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Text(item.getSummary()),
            Container(
              child: Row(
                children: <Widget>[
                  Icon(Icons.access_time, size: 16),
                  Text(item.getDate(),
                      style: TextStyle(fontSize: 12)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.share, size: 16),
                    onPressed: () {
                      Share.share("${item.title} ${item.url}");
                    },
                    iconSize: 12,
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
