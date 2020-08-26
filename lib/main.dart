import 'package:flutter/material.dart';
import 'package:news/connectors/wrapper.dart';
import 'package:news/models/user.dart';
import 'package:news/src/loginDetails/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
