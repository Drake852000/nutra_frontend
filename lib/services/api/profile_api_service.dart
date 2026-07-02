import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/user_model.dart';

class ProfileApiService {
  static const String baseUrl = "http://10.0.2.2:5191";

  Future<Map<String, String>> _headers() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token");

    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      if (token != null) "Authorization": "Bearer $token",
    };
  }

  // 👤 USER PROFILE (NUEVO ENDPOINT CORRECTO)
  Future<UserModel> getProfile(String userId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/User/Profile?UserId=$userId"),
      headers: await _headers(),
    );

    print("PROFILE: ${response.body}");

    if (response.statusCode != 200) {
      throw Exception("Error profile");
    }

    return UserModel.fromJson(jsonDecode(response.body));
  }

  // 🧠 CATÁLOGO DE CONDICIONES (para enriquecer UI)
  Future<List<dynamic>> getAllConditions() async {
    final response = await http.get(
      Uri.parse("$baseUrl/Health/conditions"),
      headers: await _headers(),
    );

    if (response.statusCode != 200) return [];

    return jsonDecode(response.body);
  }

  // 👤 CONDICIONES DEL USUARIO (nuevo endpoint backend)
  Future<List<dynamic>> getUserConditions(String userId) async {
    final response = await http.get(
      Uri.parse("$baseUrl/Health/MedicalConditions/user?UserId=$userId"),
      headers: await _headers(),
    );

    if (response.statusCode != 200) return [];

    return jsonDecode(response.body);
  }
}