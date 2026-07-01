class MealModel {
  final String id;
  final String name;
  final String description;
  final double price;

  MealModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      id: (json["id"] ?? "").toString(),
      name: (json["name"] ?? "").toString(),
      description: (json["description"] ?? "").toString(),
      price: (json["price"] ?? 0).toDouble(),
    );
  }
}