import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/restaurant_model.dart';
import '../../providers/menu_provider.dart';
import '../../widgets/product_card.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final RestaurantModel restaurant;

  const RestaurantDetailScreen({
    super.key,
    required this.restaurant,
  });

  @override
  State<RestaurantDetailScreen> createState() =>
      _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState
    extends State<RestaurantDetailScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context
          .read<MenuProvider>()
          .loadMenu(widget.restaurant.id);
    });
  }

  @override
  Widget build(BuildContext context) {

    final provider = context.watch<MenuProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.restaurant.name),
      ),

      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    widget.restaurant.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(widget.restaurant.address),

                  const SizedBox(height: 4),

                  Text(widget.restaurant.contactPhone),

                  const SizedBox(height: 24),

                  const Text(
                    "Platos disponibles",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  if (provider.meals.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          "No hay platos disponibles",
                        ),
                      ),
                    ),

                  ...provider.meals.map(
                    (meal) => ProductCard(
                      product: meal,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}