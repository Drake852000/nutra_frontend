class RestaurantModel {
  final String name;
  final String address;
  final String contactPhone;
  final bool isActive;

  RestaurantModel({
    required this.name,
    required this.address,
    required this.contactPhone,
    required this.isActive,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) {
    return RestaurantModel(
      name: json["name"] ?? "",
      address: json["address"] ?? "",
      contactPhone: json["contactPhone"] ?? "",
      isActive: json["isActive"] ?? true,
    );
  }
}