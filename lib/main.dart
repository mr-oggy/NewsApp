import 'package:flutter/material.dart';
import 'package:news/connectors/wrapper.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News',
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
