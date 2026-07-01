class UserModel {
  final String userId;
  final String fullName;
  final HealthProfile? healthProfile;
  final List<dynamic> conditions;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.healthProfile,
    required this.conditions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: json["userId"] ?? "",
      fullName: json["fullName"] ?? "",
      healthProfile: json["healthProfile"] != null
          ? HealthProfile.fromJson(json["healthProfile"])
          : null,
      conditions: json["conditions"] ?? [],
    );
  }
}

class HealthProfile {
  final int caloriesGoal;
  final int proteinGoal;
  final int carbsGoal;
  final int fatGoal;

  HealthProfile({
    required this.caloriesGoal,
    required this.proteinGoal,
    required this.carbsGoal,
    required this.fatGoal,
  });

  factory HealthProfile.fromJson(Map<String, dynamic> json) {
    return HealthProfile(
      caloriesGoal: json["caloriesGoal"] ?? 0,
      proteinGoal: json["proteinGoal"] ?? 0,
      carbsGoal: json["carbsGoal"] ?? 0,
      fatGoal: json["fatGoal"] ?? 0,
    );
  }
}