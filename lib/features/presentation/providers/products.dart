import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:interview_app/features/data/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    String data = File('assets/data.json').readAsStringSync();

    final jsonData = json.decode(data);
    _products = (jsonData.products as List)
        .map((product) => Product.fromJson(product))
        .toList();
    notifyListeners();
  }
}
