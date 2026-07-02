import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/restaurant_model.dart';

class RestaurantApiService {
  final String baseUrl = "http://10.0.2.2:5191";

  Future<Map<String, String>> _headers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  // ✅ RESTAURANTES
  Future<List<RestaurantModel>> getRestaurants() async {
    final response = await http.get(
      Uri.parse("$baseUrl/Catalog/restaurants"),
      headers: await _headers(),
    );

    if (response.statusCode != 200) {
      return [];
    }

    final List data = jsonDecode(response.body);

    return data.map((e) => RestaurantModel.fromJson(e)).toList();
  }

  // 🔥 MENÚ POR RESTAURANTE (ARREGLA TU ERROR getMenu)
  Future<List<dynamic>> getMenu(String restaurantId) async {
    final response = await http.get(
      Uri.parse(
        "$baseUrl/Catalog/restaurants/menu?RestaurantId=$restaurantId",
      ),
      headers: await _headers(),
    );

    if (response.statusCode != 200) {
      return [];
    }

    return jsonDecode(response.body);
  }
}