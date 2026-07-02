import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../services/api/profile_api_service.dart';

class UserProvider extends ChangeNotifier {
  final ProfileApiService _service = ProfileApiService();

  UserModel? user;
  bool isLoading = false;

  Future<void> loadUser() async {
    isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token == null) throw Exception("No token");

      final decoded = JwtDecoder.decode(token);
      final userId = decoded["sub"].toString();

      user = await _service.getProfile(userId);
    } catch (e) {
      print("ERROR USER PROVIDER: $e");
      user = null;
    }

    isLoading = false;
    notifyListeners();
  }
}