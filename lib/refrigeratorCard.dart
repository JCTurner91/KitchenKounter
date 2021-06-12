import 'package:flutter/material.dart';
import 'package:kitchen_kounter/baseCard.dart';

class Refridgerator extends StatefulWidget {
  Refridgerator({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _RefridgeratorState createState() => _RefridgeratorState();
}

class _RefridgeratorState extends State<Refridgerator> {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      cardTitle: 'Refrigerator',
      imagePath: 'assets/images/open_fridge.jpg',
      alignment: Alignment.bottomLeft,
    );
  }
}