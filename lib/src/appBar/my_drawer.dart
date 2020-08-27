import 'package:flutter/material.dart';
import 'package:news/src/appBar/listTileAll.dart';
import 'package:news/src/news/category.dart';
import 'package:provider/provider.dart';

import 'package:news/models/user.dart';
import 'package:news/src/loginDetails/pages/profil.dart';
import 'package:news/src/loginDetails/services/auth.dart';

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
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'News in general',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'general',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Business news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'business',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Technology news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'technology',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Science news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'science',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Health news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'health',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Entertainment news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'entertainment',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Sports news',
          navigate: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Category(
                          category: 'sports',
                        )));
          },
          trailingIcon: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
        ListTileAll(
          closeDrawer: closeDrawer,
          title: 'Log Out',
          navigate: () async {
            await _auth.signOut();
          },
          trailingIcon: Icon(Icons.logout, color: Colors.black),
          leadingIcon: Icon(Icons.person, color: Colors.black),
        ),
      ]),
    );
  }
}
