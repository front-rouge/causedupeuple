import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:causedupeuple/utils/new_item.dart';

dynamic getDataFromAPI(String url) async {
  print(url);
  final httpResponse = await http.get(url);
  if (httpResponse.statusCode == 200) {
    return json.decode(httpResponse.body);
  }
  throw Exception(
      "Request failed with status code: ${httpResponse.statusCode}");
}

Future<List<NewItem>> fetchNews(int category, int offset) async {
  var res = List<NewItem>();
  final categoryStr = category > 0 ? "&categories=$category" : "";
  final postsList = await getDataFromAPI(
      'https://www.causedupeuple.info/wp-json/wp/v2/posts?page=$offset&_embed$categoryStr');
  for (var post in postsList) {
    final imgList =
        post['_embedded']['wp:featuredmedia'];
    var img;
    print(post);
    if (imgList != null && imgList.length > 0) {
      img = imgList.first;
    } else {
      img = null;
    }
    res.add(NewItem(
        title: post['title']['rendered'],
        url: post['link'],
        content: post['content']['rendered'],
        img: img == null ? null : img['source_url'],
        categories: List<int>.from(post['categories']),
        date: DateTime.parse(post['date'])));
  }
  return res;
}
