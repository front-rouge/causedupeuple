import 'package:causedupeuple/blocs/bloc.dart';
import 'package:causedupeuple/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' show Client;

void main() => runApp(CdpApp());

class CdpApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Cause du Peuple',
      theme: ThemeData(
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
        primaryColor: Colors.red,
        accentColor: Colors.redAccent
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        primaryColor: Colors.red[900],
        accentColor: Colors.redAccent[700]
      ),
      home: BlocProvider(
        create: (context) => ArticleBloc(client: Client())..add(ArticleFetch()),
        child: HomeScreen()
      )
    );
  }
}