import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  IconData iconStyle;
  DrawerItem(this.title, this.iconStyle);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 206, 169, 212),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        // height: 20,
        // width: 20,
        child: Icon(
          iconStyle,
          size: 18,
          color: Colors.purple,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: null,
    );
  }
}
