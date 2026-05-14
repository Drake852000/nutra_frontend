import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../repositories/user_repository.dart';

class UserProvider extends ChangeNotifier {

  final UserRepository repository;

  UserProvider(this.repository);

  UserModel? user;

  bool isLoading = false;

  Future<void> loadUser() async {

    isLoading = true;
    notifyListeners();

    user = await repository.getUser();

    isLoading = false;
    notifyListeners();
  }
}