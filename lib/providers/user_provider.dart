import 'package:flutter/material.dart';
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
      // 🔥 IMPORTANTE: el backend requiere UserId
      const userId = "8add076c-3af4-42f7-a77a-3221ce8a8281";

      user = await _service.getProfile(userId);
    } catch (e) {
      user = null;
    }

    isLoading = false;
    notifyListeners();
  }
}