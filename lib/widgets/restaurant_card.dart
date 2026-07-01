import 'package:flutter/material.dart';
import '../../models/restaurant_model.dart';
import '../screens/restaurants/restaurant_detail_screen.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantModel restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("👉 CLICK RESTAURANT: ${restaurant.name}");
        print("👉 ID: ${restaurant.id}");

        if (restaurant.id.isEmpty) {
          print("❌ ID VACÍO, NO NAVEGA");
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RestaurantDetailScreen(
              restaurant: restaurant,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          restaurant.name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}