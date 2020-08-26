import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final Function closeDrawer;
  MyDrawer({this.closeDrawer});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.all(0), children: [
        UserAccountsDrawerHeader(
          accountName: Text("Abhishek Kumar Gupta"),
          accountEmail: Text("abhishekkumargupta11@gmail.com"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1504567961542-e24d9439a724?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=967&q=80"),
          ),
        ),
        ListTile(
          title: Text(
            '...',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onTap: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => Home(),
            //   ),
            // );
            closeDrawer();
          },
        ),
        ListTile(
          title: Text(
            '....',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onTap: () {
            closeDrawer();
          },
        ),
        ListTile(
          title: Text(
            "....",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          onTap: () {
            closeDrawer();
          },
        ),
      ]),
    );
  }
}
