import 'package:causedupeuple/utils/new_item.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class NewCard extends StatelessWidget {
  final NewItem item;

  NewCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Card(
      child: InkWell(
        onTap: () {
          print("pressed");
        },
        child: Column(
          children: <Widget>[
            Image.network(item.img, fit: BoxFit.fitWidth),
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
                  Text(item.date.toIso8601String(),
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
