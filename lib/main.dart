import 'home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
      backgroundColor: Colors.white30,
      brightness: Brightness.light,
      primarySwatch: Colors.red,
    ),
    darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange
    ),
    home: MyApp()));

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: HomeVideo());
  }
}
