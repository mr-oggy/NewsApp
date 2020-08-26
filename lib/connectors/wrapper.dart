import 'package:flutter/material.dart';
import 'package:news/connectors/connector.dart';
import 'package:news/models/user.dart';
import 'package:news/src/loginDetails/authenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Connector();
    final user = Provider.of<UserModel>(context);
    // either home or uthenticate
    if (user == null) {
      return Authenticate();
    } else {
      return Connector();
    }
  }
}
