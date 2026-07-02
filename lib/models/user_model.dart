class UserModel {
  final String userId;
  final String fullName;
  final String email;
  final HealthProfile? healthProfile;
  final List<ConditionModel> conditions;

  UserModel({
    required this.userId,
    required this.fullName,
    required this.email,
    required this.healthProfile,
    required this.conditions,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      userId: (json["userId"] ?? "").toString(),
      fullName: (json["fullName"] ?? "").toString(),
      email: (json["email"] ?? "").toString(),

      healthProfile: json["healthProfile"] != null
          ? HealthProfile.fromJson(json["healthProfile"])
          : null,

      conditions: (json["conditions"] as List? ?? [])
          .map((e) => ConditionModel.fromJson(e))
          .toList(),
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
      caloriesGoal: (json["caloriesGoal"] ?? 0) as int,
      proteinGoal: (json["proteinGoal"] ?? 0) as int,
      carbsGoal: (json["carbsGoal"] ?? 0) as int,
      fatGoal: (json["fatGoal"] ?? 0) as int,
    );
  }
}

class ConditionModel {
  final int id;
  final String name;
  final String type;

  ConditionModel({
    required this.id,
    required this.name,
    required this.type,
  });

  factory ConditionModel.fromJson(Map<String, dynamic> json) {
    return ConditionModel(
      id: (json["id"] ?? 0) as int,
      name: (json["name"] ?? "").toString(),
      type: (json["type"] ?? "").toString(),
    );
  }
}