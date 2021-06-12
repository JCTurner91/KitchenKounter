import 'package:flutter/material.dart';

class BaseCard extends StatefulWidget {
  BaseCard({Key key, this.cardTitle, this.imagePath, this.alignment}) : super(key: key);

  final String cardTitle;
  final String imagePath;
  final Alignment alignment;

  @override
  _BaseCardState createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:220,
      margin: EdgeInsets.only(top: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        clipBehavior: Clip.antiAlias,
        elevation: 5,
        child: Container(
          alignment: widget.alignment,
          padding: (widget.alignment == Alignment.bottomLeft) ? EdgeInsets.only(left: 10) : EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.imagePath),
              fit: BoxFit.cover,
            ),
          ),
          child: Text(
            widget.cardTitle,
            style: TextStyle(
              fontSize: 38, 
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          ),
        )
      ),
    );
  }
}