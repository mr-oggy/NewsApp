import 'package:flutter/material.dart';

class MyAppBar extends PreferredSize {
  @override
  Size get preferredSize => Size.fromHeight(58);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text('N',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic)),
            Text('EW',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Text('S',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            Spacer(flex: 3),
          ],
        ),
        iconTheme: IconThemeData(color: Colors.white, size: 20.0));
  }
}
