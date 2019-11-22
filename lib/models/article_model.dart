import 'package:html_unescape/html_unescape.dart';

class ArticleModel {

  static final HtmlUnescape html = HtmlUnescape();

  final int id;
  final String url;
  final String title;
  final String content;
  final String summary;
  final DateTime date;
  final String imgUrl;
  final int imgWidth;
  final int imgHeight;

  ArticleModel.fromJson(Map<String, dynamic> json) :
    id = json['id'],
    url = json['link'],
    title = _removeHtmlCrap(json['title']['rendered']),
    content = json['content']['rendered'],
    summary = _removeHtmlCrap(json['excerpt']['rendered']),
    date = DateTime.parse(json['date']),
    imgUrl = json['_embedded']['wp:featuredmedia'][0]['source_url'],
    imgWidth = json['_embedded']['wp:featuredmedia'][0]['media_details']['width'],
    imgHeight = json['_embedded']['wp:featuredmedia'][0]['media_details']['height'];

    static String _removeHtmlCrap(String crap) {
      crap = html.convert(crap);
      crap = crap.replaceAll(RegExp(r"<[^>]*>"), '');
      crap = crap.trim();
      return crap;
    }
}