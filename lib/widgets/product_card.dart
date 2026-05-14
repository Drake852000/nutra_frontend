import 'package:flutter/material.dart';

import '../models/product_model.dart';
import '../core/constants/app_colors.dart';
import '../screens/product/product_detail_screen.dart';

class ProductCard extends StatelessWidget {

  final ProductModel product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onTap: () {

        Navigator.push(

          context,

          MaterialPageRoute(

            builder: (_) => ProductDetailScreen(
              product: product,
            ),
          ),
        );
      },

      child: Container(

        margin: const EdgeInsets.only(bottom: 16),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          boxShadow: [

            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            ClipRRect(

              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),

              child: Image.network(

                product.imageUrl,

                height: 180,
                width: double.infinity,

                fit: BoxFit.cover,

                errorBuilder: (
                  context,
                  error,
                  stackTrace,
                ) {

                  return Container(

                    height: 180,

                    color: Colors.grey.shade300,

                    child: const Center(

                      child: Icon(
                        Icons.image,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(

              padding: const EdgeInsets.all(16),

              child: Column(

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(

                    product.name,

                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: TextStyle(
                      color: Colors.grey.shade700,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                    children: [

                      Text(

                        '${product.calories} kcal',

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Text(

                        'S/ ${product.price.toStringAsFixed(2)}',

                        style: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(

                    mainAxisAlignment:
                        MainAxisAlignment.spaceAround,

                    children: [

                      _macroItem(
                        'Prot',
                        '${product.protein}g',
                        AppColors.protein,
                      ),

                      _macroItem(
                        'Carbs',
                        '${product.carbs}g',
                        AppColors.carbs,
                      ),

                      _macroItem(
                        'Grasas',
                        '${product.fat}g',
                        AppColors.fats,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _macroItem(
    String title,
    String value,
    Color color,
  ) {

    return Column(

      children: [

        Text(

          title,

          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 4),

        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}