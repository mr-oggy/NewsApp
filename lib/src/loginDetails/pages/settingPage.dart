import 'package:flutter/material.dart';
import 'package:news/src/appBar/my_app_bar.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: MyAppBar(),
      body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Version',
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                '^ 1.O',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 40),
              Text(
                'Developed by',
                style: TextStyle(color: Colors.white54, fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                'Abhishek Kumar Gupta',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
              SizedBox(height: 10),
              Text(
                'abhishekkumargupta11@gmail.com',
                style: TextStyle(color: Colors.white24, fontSize: 16),
              ),
            ],
          )),
    );
  }
}
