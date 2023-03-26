import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_app/features/data/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];
  bool _isLoading = false;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;

  Future<void> getProducts() async {
    _isLoading = true;
    notifyListeners();
    String data = File('assets/data.json').readAsStringSync();
    await Future.delayed(const Duration(seconds: 2));
    final jsonData = json.decode(data);
    _products = (jsonData.products as List)
        .map((product) => Product.fromJson(product))
        .toList();
    _isLoading = false;
    notifyListeners();
  }
}
