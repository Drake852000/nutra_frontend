import 'package:flutter/material.dart';

import '../../../models/restaurant_model.dart';

import '../../../widgets/restaurant_card.dart';

class RestaurantSection
    extends StatelessWidget {

  final List<RestaurantModel>
      restaurants;

  const RestaurantSection({
    super.key,
    required this.restaurants,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        const Text(

          'Restaurantes',

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(

          height: 240,

          child: ListView.builder(

            scrollDirection:
                Axis.horizontal,

            itemCount:
                restaurants.length,

            itemBuilder:
                (context, index) {

              final restaurant =
                  restaurants[index];

              return RestaurantCard(
                restaurant: restaurant,
              );
            },
          ),
        ),
      ],
    );
  }
}