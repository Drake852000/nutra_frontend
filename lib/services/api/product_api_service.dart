import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/product_model.dart';

class ProductApiService {
  final String baseUrl = "http://10.0.2.2:5191";

  Future<Map<String, String>> _headers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    return {
      "Content-Type": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  // ✅ AHORA EL ENDPOINT REAL
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(
      Uri.parse("$baseUrl/Recommendation/meals"),
      headers: await _headers(),
    );

    if (response.statusCode != 200) {
      return [];
    }

    final List data = jsonDecode(response.body);

    return data.map((e) => ProductModel.fromJson(e)).toList();
  }
}