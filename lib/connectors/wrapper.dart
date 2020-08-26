import 'package:flutter/material.dart';
import 'package:news/connectors/connector.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Connector();
    // final user = Provider.of<User>(context);
    // either home or uthenticate
    // if (user == null) {
    //   return Authenticate();
    // } else {
    //   return Home();
    // }
  }
}
