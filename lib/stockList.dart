import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kitchen_kounter/addShoppingListItem.dart';
import 'package:kitchen_kounter/addStockItem.dart';
import 'package:kitchen_kounter/mainDrawer.dart';
import 'package:kitchen_kounter/measurements.dart';
import 'package:kitchen_kounter/shoppingList.dart';
import 'package:provider/provider.dart';

class StockListModel extends ChangeNotifier {
  final List<StockItem> _items = [];

  UnmodifiableListView<StockItem> get items => UnmodifiableListView<StockItem>(_items);

  void addItem(StockItem item) {
    if (_items.where((element) => element.getId() == item.getId()).length > 0) {
      _items.removeWhere((element) => element.getId() == item.getId());
    }
    _items.add(item);
    _items.sort((a, b) => a.getName().compareTo(b.getName()));
    notifyListeners();
  }

  void updateStock(List<ListItem> purchasedItems) {
    purchasedItems.forEach((element) { 
      if(_items.where((e) => e.getName() == element.getName()).isNotEmpty) {
        // TODO: Eventually this should add to existing stock, not replace
        _items.singleWhere((e) => e.getName() == element.getName()).setQuantity(element.getQuantity());
      } else {
        _items.add(StockItem(element.getName(), element.getQuantity(), element.getMeasurement(), null));
      }
    });
  }
}

void addToCart(context, items) {
  for(StockItem item in items) {
    if (item.getQuantity() <= 0) {
      ListItem newItem = ListItem(item.getName(), 0.0, Measurements.quantity, false);
      Provider.of<ShoppingListModel>(context, listen: false).addItem(newItem);
    }
  }
}

class StockList extends StatefulWidget {
  StockList({Key key}) : super(key: key);

  @override
  _StockListState createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StockListModel> (
      builder: (context, list, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('My Kitchen'),
            actions: <Widget>[
              IconButton(
                icon: const Icon(Icons.add_shopping_cart),
                tooltip: 'Update shopping list with low stock',
                onPressed: () => addToCart(context, list._items),
              ),
            ],
          ),
          drawer: MainDrawer(),
          body: ListView.separated(
            padding: EdgeInsets.only(top: 8),
            itemCount: list._items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => Navigator.pushNamed(context, '/stockList/addItem', arguments: list._items.elementAt(index)),
                title: Text(list._items.elementAt(index).getName(), style: TextStyle(fontSize: 20)),
                subtitle: Text(list._items.elementAt(index).getQuantity().toString() + ' '
                  + describeEnum(list._items.elementAt(index).getMeasurement()),
                  style: TextStyle(fontSize: 16)),
                trailing: Text(list._items.elementAt(index).getExpirationDate() != null
                  ? 'Expires: ' + list._items.elementAt(index).getExpirationDate().toString().substring(0, 10)
                  : 'No expiration', style: TextStyle(fontSize: 16),),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2, indent: 10, endIndent: 10,),
          ),
          floatingActionButton: Container(
            height: 70,
            width: 70,
            child: FloatingActionButton(
              child: Icon(Icons.add, size: 40,),
              onPressed: () => Navigator.pushNamed(context, '/stockList/addItem'),
            ),
          ),
        );
      }
    );
  }
}