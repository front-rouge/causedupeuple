import 'package:flutter/material.dart';
import 'package:html_unescape/html_unescape.dart';

class NewItem {

  static final HtmlUnescape html = HtmlUnescape();

  final String title;
  final String content;
  final String url;
  final String img;
  final List<int> categories;
  final DateTime date;

  NewItem(
      {@required String title,
      @required this.content,
      @required this.url,
      @required this.img,
      @required this.categories,
      @required this.date}) : this.title = html.convert(title);
  
  String getSummary() {
    var res = html.convert(this.content);
    res = res.replaceAll(RegExp(r"<[^>]*>"), "");
    res = res.replaceAll("\n", "");
    res = res.trim();
    res = res.substring(0, this.content.length > 120 ? 120 : this.content.length);
    res += "...";
    return res;
  }
}