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
    print("🔥 RAW RESTAURANT JSON: $json");

    final name = (json["name"] ?? "").toString();

    String image =
        "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4";

    // Puedes asignar imágenes distintas según el restaurante
    if (name.toLowerCase().contains("parrilla")) {
      image =
          "https://images.unsplash.com/photo-1550547660-d9450f859349";
    } else if (name.toLowerCase().contains("sushi")) {
      image =
          "https://images.unsplash.com/photo-1579871494447-9811cf80d66c";
    } else if (name.toLowerCase().contains("vegano")) {
      image =
          "https://images.unsplash.com/photo-1546069901-ba9599a7e63c";
    }

    return RestaurantModel(
      id: (json["id"] ??
              json["restaurantId"] ??
              json["Id"] ??
              json["restaurant_id"] ??
              "")
          .toString(),
      name: name,
      address: (json["address"] ?? "").toString(),
      contactPhone: (json["contactPhone"] ?? "").toString(),
      isActive: json["isActive"] ?? false,
      imageUrl: image,
    );
  }
}