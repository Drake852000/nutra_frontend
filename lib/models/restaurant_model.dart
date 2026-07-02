class RestaurantModel {
  final String id;
  final String name;
  final String address;
  final String contactPhone;
  final bool isActive;

  final String imageUrl;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.address,
    required this.contactPhone,
    required this.isActive,
    required this.imageUrl,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      id: json["id"] ?? "",
      name: json["name"] ?? "",
      address: json["address"] ?? "",
      contactPhone: json["contactPhone"] ?? "",
      isActive: json["isActive"] ?? false,
      imageUrl:
          "https://images.unsplash.com/photo-1555992336-03a23c2d75ee",
    );
  }
}