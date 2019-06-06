import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:causedupeuple/utils/new_item.dart';

dynamic getDataFromAPI(url) async {
  final httpResponse = await http.get(url);
  if (httpResponse.statusCode == 200) {
    return json.decode(httpResponse.body);
  }
  throw Exception(
      "Request failed with status code: ${httpResponse.statusCode}");
}

Future<List<NewItem>> fetchNews() async {
  var res = List<NewItem>();
  final postsList = await getDataFromAPI(
      'https://www.causedupeuple.info/wp-json/wp/v2/posts');
  for (var post in postsList) {
    final imgList =
        await getDataFromAPI(post['_links']['wp:attachment'][0]['href']);
    final img = imgList.first;
    res.add(NewItem(
        title: post['title']['rendered'],
        url: post['link'],
        content: post['content']['rendered'],
        img: img['guid']['rendered'],
        categories: List<int>.from(post['categories']),
        date: DateTime.parse(post['date'])));
  }
  return res;
}
