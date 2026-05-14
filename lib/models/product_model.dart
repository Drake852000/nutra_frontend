class ProductModel {

  final int id;
  final String name;
  final String description;
  final double price;

  final int protein;
  final int carbs;
  final int fat;
  final int calories;

  final String imageUrl;

  final int restaurantId;

  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.calories,
    required this.imageUrl,
    required this.restaurantId,
    required this.category,
  });
}