import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kitchen_kounter/measurements.dart';
import 'package:kitchen_kounter/stockList.dart';
import 'package:provider/provider.dart';


class StockItem {
  String _id;
  String _name;
  double _quantity;
  Measurements _measurement;
  DateTime _expirationDate;

  StockItem(String name, double quantity, Measurements measurement, DateTime expirationDate) {
    this._id = Random.secure().nextDouble().toString();
    this._name = name;
    this._quantity = quantity;
    this._measurement = measurement;
    this._expirationDate = expirationDate;
  }

  getId() => _id;
  getName() => _name;
  getQuantity() => _quantity;
  getMeasurement() => _measurement;
  getExpirationDate() => _expirationDate;

  setName(String name) => { _name = name };
  setQuantity(double quantity) => { _quantity = quantity };
  setMeasurement(Measurements measurement) => { _measurement = measurement };
  setExpirationDate(DateTime expiration) => { _expirationDate = expiration };
}

class AddStockItem extends StatefulWidget {
  AddStockItem({Key key}) : super(key: key);

  @override
  _AddStockItemState createState() => _AddStockItemState();
}

class _AddStockItemState extends State<AddStockItem> {
  var item = StockItem('', 0, Measurements.quantity, null);

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
    _quantityController.dispose();
    super.dispose();
  }

  Future<Null> _selectDate(BuildContext context) async {
      final DateTime date = await showDatePicker(context: context,
        initialDate: item.getExpirationDate() ?? DateTime.now(),
        firstDate: DateTime.now(), lastDate: DateTime(DateTime.now().year+20));

      if (date != null) {
        setState(() { item.setExpirationDate(date); });
      }
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
    Provider.of<StockListModel>(context, listen: false).addItem(item);
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
        title: Text(newItem ? 'Add Stock to My Kitchen' : 'Edit Stock in My Kitchen'),
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
              FlatButton(
                child: Text(item.getExpirationDate() == null ? 'Set Expiration Date' :
                  item.getExpirationDate().toString().substring(0, 10),
                  style: TextStyle(color: Colors.blueAccent, fontSize: 18),),
                onPressed: () => _selectDate(context),
              ),
              Expanded(child: SizedBox()),
              RaisedButton(
                child: Text(newItem ? 'Add Item' : 'Save Item'),
                onPressed: () => saveItem(),
              )
            ],)
          ],
        ),
      )
    );
  }
}