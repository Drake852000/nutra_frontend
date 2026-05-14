import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../repositories/product_repository.dart';

class ProductProvider extends ChangeNotifier {

  final ProductRepository repository;

  ProductProvider(this.repository);

  List<ProductModel> products = [];

  bool isLoading = false;

  Future<void> loadProducts() async {

    isLoading = true;
    notifyListeners();

    products = await repository.getProducts();

    isLoading = false;
    notifyListeners();
  }
}