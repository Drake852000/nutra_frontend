class UserModel {

  final String name;
  final String email;

  final String goal;

  final int caloriesGoal;
  final int proteinGoal;
  final int carbsGoal;
  final int fatGoal;

  final String imageUrl;

  UserModel({
    required this.name,
    required this.email,
    required this.goal,
    required this.caloriesGoal,
    required this.proteinGoal,
    required this.carbsGoal,
    required this.fatGoal,
    required this.imageUrl,
  });
}