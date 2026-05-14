import '../models/user_model.dart';

import '../services/mock/user_mock_service.dart';

class UserRepository {

  final UserMockService mockService;

  UserRepository(this.mockService);

  Future<UserModel> getUser() {

    return mockService.getUser();
  }
}