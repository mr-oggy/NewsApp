import 'package:flutter/material.dart';
import 'package:news/models/user.dart';
import 'package:news/src/loginDetails/pages/profil.dart';
import 'package:news/src/loginDetails/services/auth.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  final AuthService _auth = AuthService();

  final Function closeDrawer;
  MyDrawer({this.closeDrawer});
  @override
  Widget build(BuildContext context) {
    UserModel user = Provider.of<UserModel>(context);
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0), children: [
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black),
            accountName: Text("${user.name}"),
            accountEmail: Text("${user.email}"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1504567961542-e24d9439a724?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"),
            ),
            onDetailsPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Profil()),
              );
              closeDrawer();
            }),
        ListTile(
          title: Text(
            "Log Out",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading: Icon(
            Icons.person,
            color: Colors.black,
          ),
          trailing: Icon(
            Icons.logout,
            color: Colors.black,
          ),
          onTap: () async {
            await _auth.signOut();
            closeDrawer();
          },
        ),
      ]),
    );
  }
}
