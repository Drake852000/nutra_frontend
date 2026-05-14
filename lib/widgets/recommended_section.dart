import 'package:flutter/material.dart';

import '../../../models/product_model.dart';
import '../../../widgets/product_card.dart';

class RecommendedSection extends StatelessWidget {
  final List<ProductModel> products;

  const RecommendedSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        const Text(
          'Recomendados para ti',

          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 16),

        SizedBox(
          height: 450,

          child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: products.length,

            itemBuilder: (context, index) {
              final product = products[index];

              return SizedBox(width: 320, child: ProductCard(product: product));
            },
          ),
        ),
      ],
    );
  }
}
