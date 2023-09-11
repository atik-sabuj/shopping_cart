import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier{

  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;


}