import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_app/features/data/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;
  Product? _selectedProduct;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  Product? get selectedProduct => _selectedProduct;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();
    // String data = File('assets/data.json').readAsStringSync();
    await Future.delayed(const Duration(seconds: 2));
    // final jsonData = json.decode(data);
    final jsonData = {
      "products": [
        {
          "id": 1,
          "product": "Amber member",
          "price": 9.0,
        },
        {
          "id": 2,
          "product": "Ruby member",
          "price": 70.0,
          "discount_price": 17.0,
        }
      ]
    };
    // _products = (jsonData.products as List)
    _products = (jsonData['products'] as List)
        .map((product) => Product.fromJson(product))
        .toList();
    _isLoading = false;
    notifyListeners();
  }

  void selectProduct(Product product) {
    _selectedProduct = product;
    notifyListeners();
  }
}
