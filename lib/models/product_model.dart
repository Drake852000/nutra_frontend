class ProductModel {
  final String id;
  final String restaurantId;

  final String name;
  final String description;

  final double price;

  final String imageUrl;

  final bool isActive;

  final int calories;

  final double protein;
  final double carbs;
  final double fat;

  ProductModel({
    required this.id,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isActive,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final nutrition = json["nutritionalInfo"] ?? {};

    return ProductModel(
      id: json["id"] ?? "",
      restaurantId: json["restaurantId"] ?? "",
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      price: (json["price"] as num?)?.toDouble() ?? 0.0,

      imageUrl: json["imageUrl"] ??
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",

      isActive: json["isActive"] ?? true,

      calories: (nutrition["calories"] as num?)?.toInt() ?? 0,
      protein: (nutrition["proteinG"] as num?)?.toDouble() ?? 0.0,
      carbs: (nutrition["carbsG"] as num?)?.toDouble() ?? 0.0,
      fat: (nutrition["fatsG"] as num?)?.toDouble() ?? 0.0,
    );
  }
}