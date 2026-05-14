import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

import '../../../widgets/product_card.dart';

class ProductsSection
    extends StatelessWidget {

  final List<ProductModel> products;

  const ProductsSection({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      crossAxisAlignment:
          CrossAxisAlignment.start,

      children: [

        const Text(

          'Platos saludables',

          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        ListView.builder(

          shrinkWrap: true,

          physics:
              const NeverScrollableScrollPhysics(),

          itemCount: products.length,

          itemBuilder:
              (context, index) {

            final product =
                products[index];

            return ProductCard(
              product: product,
            );
          },
        ),
      ],
    );
  }
}