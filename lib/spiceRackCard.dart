import 'package:flutter/material.dart';
import 'package:kitchen_kounter/baseCard.dart';

class SpiceRack extends StatefulWidget {
  SpiceRack({Key key, this.appTitle}) : super(key: key);

  final String appTitle;

  @override
  _SpiceRackState createState() => _SpiceRackState();
}

class _SpiceRackState extends State<SpiceRack> {
  @override
  Widget build(BuildContext context) {
    return BaseCard(
      cardTitle: 'Spice Rack',
      imagePath: 'assets/images/spice_rack.jpeg',
      alignment: Alignment.bottomLeft,
    );
  }
}