import 'package:flutter/material.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  List<Products> _items = [];

  List<Product> get items {
    return [..._items];
  }

  void addProduct(value){
    //_items.add(value);
    notifyListeners();
  }
}
