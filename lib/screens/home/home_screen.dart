import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../../providers/restaurant_provider.dart';

import '../../widgets/home_header.dart';
import '../../widgets/home_search_bar.dart';
import '../../widgets/category_list.dart';
import '../../widgets/recommended_section.dart';
import '../../widgets/restaurant_section.dart';
import '../../widgets/products_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final productProvider = context.read<ProductProvider>();
      final restaurantProvider = context.read<RestaurantProvider>();

      productProvider.loadProducts();
      restaurantProvider.loadRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    final restaurantProvider = context.watch<RestaurantProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Healthy Food'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeHeader(),
            const SizedBox(height: 24),
            const HomeSearchBar(),
            const SizedBox(height: 24),
            const CategoryList(),
            const SizedBox(height: 32),

            RecommendedSection(
              products: productProvider.products,
            ),

            const SizedBox(height: 32),

            RestaurantSection(
              restaurants: restaurantProvider.restaurants,
            ),

            const SizedBox(height: 32),

            if (productProvider.isLoading)
              const Center(child: CircularProgressIndicator())
            else
              ProductsSection(
                products: productProvider.products,
              ),
          ],
        ),
      ),
    );
  }
}