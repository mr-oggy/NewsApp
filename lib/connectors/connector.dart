//Connecting home with foldable drawer and appbar
import 'package:flutter/material.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:news/src/appBar/my_drawer.dart';
import 'package:news/src/home.dart';
import 'package:swipedetector/swipedetector.dart';

class Connector extends StatefulWidget {
  Connector({Key key}) : super(key: key);

  @override
  _ConnectorState createState() => _ConnectorState();
}

class _ConnectorState extends State<Connector> {
  FSBStatus status;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
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
        // iconTheme: IconThemeData(color: Colors.white, size: 20.0),
        leading: IconButton(
          splashColor: Colors.transparent,
          splashRadius: 0.1,
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              status = status == FSBStatus.FSB_OPEN
                  ? FSBStatus.FSB_CLOSE
                  : FSBStatus.FSB_OPEN;
            });
          },
          color: Colors.white,
        ),
      ),
      body: SwipeDetector(
        onSwipeLeft: () {
          setState(() {
            status = FSBStatus.FSB_CLOSE;
          });
        },
        onSwipeRight: () {
          setState(() {
            status = FSBStatus.FSB_OPEN;
          });
        },
        child: FoldableSidebarBuilder(
          status: status,
          drawer: MyDrawer(
            closeDrawer: () {
              setState(() {
                status = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: Home(),
          drawerBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
