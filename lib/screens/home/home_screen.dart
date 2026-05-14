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
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {

      context
          .read<ProductProvider>()
          .loadProducts();

      context
          .read<RestaurantProvider>()
          .loadRestaurants();
    });
  }

  @override
  Widget build(BuildContext context) {

    final productProvider =
        context.watch<ProductProvider>();

    final restaurantProvider =
        context.watch<RestaurantProvider>();

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          'Healthy Food',
        ),

        actions: [

          IconButton(

            onPressed: () {},

            icon: const Icon(
              Icons.notifications_none,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            // HEADER

            const HomeHeader(),

            const SizedBox(height: 24),

            // SEARCH BAR

            const HomeSearchBar(),

            const SizedBox(height: 24),

            // CATEGORY LIST

            const CategoryList(),

            const SizedBox(height: 32),

            // RECOMMENDED SECTION

            RecommendedSection(
              products:
                  productProvider.products,
            ),

            const SizedBox(height: 32),

            // RESTAURANTS SECTION

            RestaurantSection(
              restaurants:
                  restaurantProvider
                      .restaurants,
            ),

            const SizedBox(height: 32),

            // LOADING

            if (productProvider.isLoading)

              const Center(
                child:
                    CircularProgressIndicator(),
              )

            else

              // PRODUCTS SECTION

              ProductsSection(
                products:
                    productProvider.products,
              ),
          ],
        ),
      ),
    );
  }
}