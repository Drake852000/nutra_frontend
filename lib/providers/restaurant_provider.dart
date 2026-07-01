import 'package:flutter/material.dart';
import '../models/restaurant_model.dart';
import '../repositories/restaurant_repository.dart';

class RestaurantProvider extends ChangeNotifier {
  final RestaurantRepository repository;

  RestaurantProvider(this.repository);

  List<RestaurantModel> restaurants = [];
  bool isLoading = false;

  Future<void> loadRestaurants() async {
    isLoading = true;
    notifyListeners();

    restaurants = await repository.getRestaurants();

    isLoading = false;
    notifyListeners();
  }
}