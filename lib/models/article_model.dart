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
    imgUrl = _getImgUrl(json),
    imgWidth = _getMediaDetails(json, "width"),
    imgHeight = _getMediaDetails(json, "height");

    static String _removeHtmlCrap(String crap) {
      crap = html.convert(crap);
      crap = crap.replaceAll(RegExp(r"<[^>]*>"), '');
      crap = crap.trim();
      return crap;
    }

    static Map<String, dynamic> _getWpMedia(json) {
      var featuredmedia = json['_embedded']['wp:featuredmedia'];
      if (featuredmedia == null)
        return null;
      return featuredmedia[0];
    }

    static String _getImgUrl(json) {
      var featuremedia = _getWpMedia(json);
      if (featuremedia == null)
        return null;
      return featuremedia['source_url'];
    }

    static int _getMediaDetails(json, String info) {
      var mediadata = _getWpMedia(json);
      if (mediadata == null)
        return 0;
      mediadata = mediadata['media_details'];
      if (mediadata == null)
        return 0;
      return mediadata[info] ?? 0;
    }
}