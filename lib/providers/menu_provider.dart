import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../services/api/menu_api_service.dart';

class MenuProvider extends ChangeNotifier {
  final MenuApiService _service = MenuApiService();

  List<ProductModel> meals = [];

  bool isLoading = false;

  Future<void> loadMenu(String restaurantId) async {
    isLoading = true;
    notifyListeners();

    meals = await _service.getMenu(restaurantId);

    isLoading = false;
    notifyListeners();
  }
}