import 'package:flutter/material.dart';
import 'package:news/src/home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.lightBlue[100]),
      home: Home(),
    );
  }
}
