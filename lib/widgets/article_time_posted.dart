import 'package:flutter/material.dart';

class ArticleTimePosted extends StatelessWidget {
  
  final DateTime date;

  ArticleTimePosted({Key key, @required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(_formatDate(date));
  }

  String _formatDate(DateTime date) {
    Duration difference  = DateTime.now().difference(date);

    if (difference.inDays <= 0) {
      if (difference.inHours <= 0) {
        if (difference.inMinutes <= 0) {
          return "A l'instant";
        } else {
          return "Il y a " + difference.inMinutes.toString() +
            (difference.inMinutes == 1 ? " minute" : " minutes");
        }
      } else {
        return "Il y a " + difference.inHours.toString() +
          (difference.inHours == 1 ? " heure" : " heures");
      }
    } else {
      return "Il y a " + difference.inDays.toString() +
        (difference.inDays == 1 ? " jour" : " jours");
    }
  }
}