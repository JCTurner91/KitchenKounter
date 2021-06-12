import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitchen_kounter/measurements.dart';
import 'package:kitchen_kounter/shoppingList.dart';
import 'package:provider/provider.dart';

class ListItem {
  String _id;
  String _name;
  double _quantity;
  Measurements _measurement;
  bool _purchased;

  ListItem(String name, double quantity, Measurements measurement, bool purchased) {
    this._id = Random.secure().nextDouble().toString();
    this._name = name;
    this._quantity = quantity;
    this._measurement = measurement;
    this._purchased = purchased;
  }

  getId() => _id;
  getName() => _name;
  getQuantity() => _quantity;
  getMeasurement() => _measurement;
  isPurchased() => _purchased;

  setName(String name) => { _name = name };
  setQuantity(double quantity) => { _quantity = quantity };
  setMeasurement(Measurements measurement) => { _measurement = measurement };
  setPurchased(bool purchased) => { _purchased = purchased };
}

class AddShoppingListItem extends StatefulWidget {
  AddShoppingListItem({Key key}) : super(key: key);

  @override
  _AddShoppingListItemState createState() => _AddShoppingListItemState();
}

class _AddShoppingListItemState extends State<AddShoppingListItem> {
  var item = ListItem('', 0, Measurements.quantity, false);

  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  void initState() {
    super.initState();
    _nameController.text = item.getName();
    _quantityController.text = item.getQuantity().toString();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool parseQuantity(String newValue) {
    try {
      item.setQuantity(double.parse(newValue));
      return true;
    } catch (Exception) {
      print('Failed to parse double.');
      return false;
    }
  }

  void saveItem() {
    Provider.of<ShoppingListModel>(context, listen: false).addItem(item);
    Navigator.pop(context,);
  }

  @override
  Widget build(BuildContext context) {
    bool newItem = true;
    if(ModalRoute.of(context).settings.arguments != null) {
      item = ModalRoute.of(context).settings.arguments;
      _nameController.text = item.getName();
      _quantityController.text = item.getQuantity().toString();
      newItem = false;
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: () => Navigator.pop(context),),
        title: Text((newItem) ? 'Add to Shopping List' : 'Edit Item'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget> [
            TextField(
              controller: _nameController,
              onChanged: (text) => item.setName(text),
              decoration: InputDecoration(
                labelText: 'Item Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0,),
            Row(children: <Widget>[
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _quantityController,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) => parseQuantity(value)
                ),
              ),
              SizedBox(width: 20.0,),
              DropdownButton<Measurements>(
                value: item.getMeasurement(),
                onChanged: (measurement) {
                  setState(() {
                    item.setMeasurement(measurement);
                  });
                },
                items: Measurements.values.map((Measurements measurement) {
                  return DropdownMenuItem<Measurements>(
                    value: measurement,
                    child: Text(describeEnum(measurement))
                  );
                }).toList(),
              ),
            ],),
            SizedBox(height: 20.0,),
            Row(children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () => setState(() {
                    item.setPurchased(!item.isPurchased());
                  }),
                  child: Row(children: <Widget>[
                    Checkbox(
                      value: item.isPurchased(),
                      onChanged: (value) => setState(() {
                        item.setPurchased(value);
                      }),
                    ),
                    Text('Purchased', style: TextStyle(fontSize: 16)),
                  ],)
                ),
              ),
              RaisedButton(
                child: Text((newItem ? 'Add' : 'Save') + ' Item'),
                onPressed: () => saveItem(),
              )
            ],)
          ],
        ),
      )
    );
  }
}