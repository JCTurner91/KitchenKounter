import 'package:flutter/material.dart';
import 'package:kitchen_kounter/baseCard.dart';

class Pantry extends StatefulWidget {
  Pantry({Key key}) : super(key: key);

  @override
  _PantryState createState() => _PantryState();
}

class _PantryState extends State<Pantry> {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      cardTitle: 'Pantry',
      imagePath: 'assets/images/pantry.jpg',
      alignment: Alignment.bottomRight,
    );
  }
}