import 'package:flutter/material.dart';

class MainDrawer extends StatefulWidget {
  MainDrawer({Key key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: AssetImage('assets/images/drawer_bg.jpg'),
                fit: BoxFit.cover
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Kitchen Kounter',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                )
              ),
            )
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, '/stockList'),
            leading: Icon(
              Icons.kitchen,
              size: 32,
            ),
            title: Text(
              'My Kitchen',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          ListTile(
            onTap: () => Navigator.pushReplacementNamed(context, '/shoppingList'),
            leading: Icon(
              Icons.format_list_bulleted,
              size: 32,
            ),
            title: Text(
              'Shopping List',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          )
        ],
      )
    );
  }
}