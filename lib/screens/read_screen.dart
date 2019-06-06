import 'dart:convert';

import 'package:causedupeuple/utils/new_item.dart';
import 'package:flutter/material.dart';

import 'package:flutter_html/flutter_html.dart';

class ReadScreen extends StatelessWidget {

  final NewItem item;

  ReadScreen({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(appBar: AppBar(title: Text(item.title),),
    body: SingleChildScrollView(child: Html(data: item.content)));
  }
}