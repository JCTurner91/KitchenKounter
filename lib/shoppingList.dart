import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kitchen_kounter/addShoppingListItem.dart';
import 'package:kitchen_kounter/mainDrawer.dart';
import 'package:kitchen_kounter/stockList.dart';
import 'package:provider/provider.dart';

class ShoppingListModel extends ChangeNotifier {
  final List<ListItem> _items = [];

  UnmodifiableListView<ListItem> get items => UnmodifiableListView<ListItem>(_items);

  void addItem(ListItem item) {
    if (_items.where((element) => element.getId() == item.getId()).length > 0) {
      _items.removeWhere((element) => element.getId() == item.getId());
    }
    _items.add(item);
    _items.sort((a, b) => a.getName().compareTo(b.getName()));
    notifyListeners();
  }

  void checkout(context) {
    List<ListItem> toRemove = _items.where((element) => element.isPurchased()).toList();
    _items.removeWhere((element) => toRemove.contains(element));
    Provider.of<StockListModel>(context, listen: false).updateStock(toRemove);
    notifyListeners();
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key}) : super(key: key);

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.done),
            tooltip: 'Done shopping',
            onPressed: () => Provider.of<ShoppingListModel>(context, listen: false).checkout(context),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Consumer<ShoppingListModel> (
        builder: (context, list, child) {
          return ListView.separated(
            padding: EdgeInsets.only(top: 8),
            itemCount: list._items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () => Navigator.pushNamed(context, '/shoppingList/addItem',
                  arguments: list._items.elementAt(index)),
                leading: Checkbox(
                  value: list._items.elementAt(index).isPurchased() ?? false,
                  onChanged: (bool newValue) {
                    setState(() {
                      list._items.elementAt(index).setPurchased(newValue);
                    });
                  },
                ),
                title: Text(list._items.elementAt(index).getName(), style: TextStyle(fontSize: 20)),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 2, indent: 10, endIndent: 10,),
          );
        }
      ),
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FloatingActionButton(
          child: Icon(Icons.add, size: 40,),
          onPressed: () => Navigator.pushNamed(context, '/shoppingList/addItem'),
        ),
      ),
    );
  }
}