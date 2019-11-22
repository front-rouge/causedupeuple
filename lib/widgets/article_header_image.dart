import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ArticleHeaderImage extends StatelessWidget  {

  final String srcUrl;
  final int srcWidth;
  final int srcHeight;

  ArticleHeaderImage({Key key, @required this.srcUrl, @required this.srcWidth, @required this.srcHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mqSize = MediaQuery.of(context).size;

    return Center(
      child: Padding(
        padding: EdgeInsets.only(bottom: 8.0),
        child: Image(
          image: CachedNetworkImageProvider(srcUrl),
          fit: BoxFit.fitWidth,
          height: (srcHeight * ((mqSize.width - 16) / srcWidth)),
        )
      )
    );
  }
}