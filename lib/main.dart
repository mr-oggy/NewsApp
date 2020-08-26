import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news/connectors/wrapper.dart';
import 'package:news/models/user.dart';
import 'package:news/src/loginDetails/services/auth.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  return runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'News',
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
