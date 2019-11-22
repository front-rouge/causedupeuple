import 'package:causedupeuple/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(CdpApp());

class CdpApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'La Cause du Peuple',
      theme: ThemeData(),
      home: HomeScreen()
    );
  }
}