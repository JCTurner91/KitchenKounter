import 'package:flutter/material.dart';
import 'package:kitchen_kounter/mainDrawer.dart';
import 'package:kitchen_kounter/pantryCard.dart';
import 'package:kitchen_kounter/refrigeratorCard.dart';
import 'package:kitchen_kounter/spiceRackCard.dart';

class MyKitchen extends StatefulWidget {
  MyKitchen({Key key}) : super(key: key);

  @override
  _MyKitchenState createState() => _MyKitchenState();
}

class _MyKitchenState extends State<MyKitchen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Kitchen'),
      ),
      drawer: MainDrawer(),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Refridgerator(),
              onTap: () => Navigator.pushNamed(context, '/stockList', arguments: 'Refrigerator'),
            ),
            ListTile(
              title: Pantry(),
              onTap: () => Navigator.pushNamed(context, '/stockList', arguments: 'Pantry'),
            ),
            ListTile(
              title: SpiceRack(),
              onTap: () => Navigator.pushNamed(context, '/stockList', arguments: 'Spice Rack'),
            )
          ],
        )
      ),
    );
  }
}