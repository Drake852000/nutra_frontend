import 'package:flutter/material.dart';

import '../models/cart_item_model.dart';
import '../models/product_model.dart';

class CartProvider extends ChangeNotifier {
  final List<CartItemModel> _items = [];

  List<CartItemModel> get items => _items;

  // ADD PRODUCT

  void addToCart(ProductModel product) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      _items[index].quantity++;
    } else {
      _items.add(
        CartItemModel(product: product),
      );
    }

    notifyListeners();
  }

  // INCREASE QUANTITY

  void increaseQuantity(ProductModel product) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      _items[index].quantity++;

      notifyListeners();
    }
  }

  // DECREASE QUANTITY

  void decreaseQuantity(ProductModel product) {
    final index = _items.indexWhere(
      (item) => item.product.id == product.id,
    );

    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }

      notifyListeners();
    }
  }

  // REMOVE PRODUCT

  void removeFromCart(ProductModel product) {
    _items.removeWhere(
      (item) => item.product.id == product.id,
    );

    notifyListeners();
  }

  // CLEAR CART

  void clearCart() {
    _items.clear();

    notifyListeners();
  }

  // TOTAL PRICE

  double get totalPrice {
    double total = 0;

    for (var item in _items) {
      total += item.product.price * item.quantity;
    }

    return total;
  }

  // TOTAL CALORIES

  int get totalCalories {
    int total = 0;

    for (var item in _items) {
      total += item.product.calories * item.quantity;
    }

    return total;
  }

  // TOTAL PROTEIN

  double get totalProtein {
    double total = 0;

    for (var item in _items) {
      total += item.product.protein * item.quantity;
    }

    return total;
  }

  // TOTAL CARBS

  double get totalCarbs {
    double total = 0;

    for (var item in _items) {
      total += item.product.carbs * item.quantity;
    }

    return total;
  }

  // TOTAL FAT

  double get totalFat {
    double total = 0;

    for (var item in _items) {
      total += item.product.fat * item.quantity;
    }

    return total;
  }
}