import '../../models/user_model.dart';

class UserMockService {

  Future<UserModel> getUser() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return UserModel(

      name: 'Omar Choque',

      email: 'omar@gmail.com',

      goal: 'Perder grasa',

      caloriesGoal: 2200,

      proteinGoal: 180,

      carbsGoal: 250,

      fatGoal: 70,

      imageUrl:
          'https://i.pravatar.cc/300',
    );
  }
}