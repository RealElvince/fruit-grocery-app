// ignore_for_file: dead_code

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // List of items on sale
  //[ itemName,itemPrice,image  Path,myColor]
  final List _myCartItems = [
    ['Apple', '50.00', 'images/apple.png', Colors.red],
    ['Apricot', '45.00', 'images/apricot.png', Colors.teal],
    ['Banana', '25.00', 'images/banana.jpg', Colors.yellow],
    ['Grape', '80.00', 'images/grape.png', Colors.brown],
    ['Guava', '20.00', 'images/guava.png', Colors.green],
    ['Jack Fruit', '100.00', 'images/jackfruit.png', Colors.green],
    ['Mango', '30.00', 'images/mango.png', Colors.green],
    ['Passion Fruit', '70.00', 'images/passionfruit.png', Colors.purple],
    ['Peas', '15.00', 'images/peas.png', Colors.teal],
    ['Pineapple', '68.00', 'images/pineapple.png', Colors.cyanAccent],
    ['Sugarcane', '20.00', 'images/sugarcane.png', Colors.blueGrey],
    ['Water Melon', '70.00', 'images/watermelon.png', Colors.lightGreenAccent]
  ];

  // List of items in my shopping cart
  List _myshopItems = [];

  // getter methods to get my list of items and shopping cart items

  get cartItems => _myCartItems;

  get shopItems => _myshopItems;

  // function to add item in the shopping cart

  void addItemsToShoppingCart(int index) {
    return _myshopItems.add(_myCartItems[index]);

    notifyListeners();
  }

  // remove item from the shopping cart

  void removeItemsFromShoppingCart(int index) {
    // ignore: void_checks
    return _myshopItems.removeAt(index);
    notifyListeners();
  }

  // Calculate total price

  String calculateTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < _myshopItems.length; i++) {
      totalPrice += double.parse(_myshopItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}
