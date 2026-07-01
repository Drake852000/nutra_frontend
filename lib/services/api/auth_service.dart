import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String baseUrl = "http://10.0.2.2:5191";

  // =========================
  // LOGIN
  // =========================
  static Future<String?> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$baseUrl/Auth/login");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "userLogin": {
          "email": email,
          "password": password,
          "fullName": ""
        }
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      final token = data["token"];

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", token);

      return token;
    }

    return null;
  }

  // =========================
  // REGISTER (CORREGIDO)
  // =========================
  static Future<bool> register({
    required String email,
    required String password,
    required String fullName,
  }) async {
    final url = Uri.parse("$baseUrl/Auth/register");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "userRegister": {
          "fullName": fullName,
          "email": email,
          "password": password
        }
      }),
    );

    return response.statusCode == 200;
  }

  // =========================
  // LOGOUT
  // =========================
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
  }

  // =========================
  // GET TOKEN
  // =========================
  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("token");
  }
}