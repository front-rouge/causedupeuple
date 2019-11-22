import 'package:causedupeuple/screens/home_screen.dart';
import 'package:flutter/material.dart';

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
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
        primaryColor: Colors.red[900],
      ),
      home: HomeScreen()
    );
  }
}