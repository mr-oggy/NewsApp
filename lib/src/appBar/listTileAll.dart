import 'package:flutter/material.dart';

class ListTileAll extends StatelessWidget {
  String title;
  Icon leadingIcon;
  Icon trailingIcon;
  ListTileAll({
    Key key,
    @required this.title,
    @required this.closeDrawer,
    this.navigate,
    this.leadingIcon,
    this.trailingIcon,
  }) : super(key: key);

  final Function closeDrawer;
  final Function navigate;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '$title',
        style: TextStyle(
          fontSize: 16,
        ),
      ),
      leading: leadingIcon, //qr_code,
      trailing: trailingIcon,
      onTap: () {
        navigate();
        closeDrawer();
      },
    );
  }
}
