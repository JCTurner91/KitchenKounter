import 'package:flutter/material.dart';
import 'package:kitchen_kounter/addShoppingListItem.dart';
import 'package:kitchen_kounter/addStockItem.dart';
import 'package:kitchen_kounter/myKitchen.dart';
import 'package:kitchen_kounter/shoppingList.dart';
import 'package:kitchen_kounter/stockList.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ShoppingListModel()),
        ChangeNotifierProvider(create: (context) => StockListModel()),
      ],
      child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Change back to '/'
      initialRoute: '/stockList',
      routes: {
        '/': (context) => MyKitchen(),
        '/stockList': (context) => StockList(),
        '/stockList/addItem': (context) => AddStockItem(),
        '/shoppingList': (context) => ShoppingList(),
        '/shoppingList/addItem': (context) => AddShoppingListItem(),
      },
      theme: ThemeData(primaryColor: Colors.lightGreen, accentColor: Colors.lightGreen)
    );
  }
}
