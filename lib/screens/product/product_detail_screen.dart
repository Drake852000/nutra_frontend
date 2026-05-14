import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';

import '../checkout/checkout_screen.dart';
import '../cart/cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {

  final ProductModel product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(product.name),
      ),

      body: SingleChildScrollView(

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            Image.network(
              product.imageUrl,
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
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
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(

                    product.description,

                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 24),

                  const Text(

                    'Información nutricional',

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 16),

                  _macroTile(
                    'Proteínas',
                    '${product.protein}g',
                  ),

                  _macroTile(
                    'Carbohidratos',
                    '${product.carbs}g',
                  ),

                  _macroTile(
                    'Grasas',
                    '${product.fat}g',
                  ),

                  _macroTile(
                    'Calorías',
                    '${product.calories} kcal',
                  ),

                  const SizedBox(height: 32),

                  Row(

                    children: [

                      // ADD TO CART

                      Expanded(

                        child: ElevatedButton(

                          onPressed: () {

                            context
                                .read<CartProvider>()
                                .addToCart(product);

                            // GO TO CART

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    const CartScreen(),
                              ),
                            );
                          },

                          child: const Text(
                            'Agregar',
                          ),
                        ),
                      ),

                      const SizedBox(width: 12),

                      // BUY NOW

                      Expanded(

                        child: ElevatedButton(

                          onPressed: () {

                            context
                                .read<CartProvider>()
                                .addToCart(product);

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) =>
                                    const CheckoutScreen(),
                              ),
                            );
                          },

                          child: const Text(
                            'Comprar ahora',
                          ),
                        ),
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

  Widget _macroTile(
    String title,
    String value,
  ) {

    return Padding(

      padding:
          const EdgeInsets.only(bottom: 12),

      child: Row(

        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(

            title,

            style: const TextStyle(
              fontSize: 16,
            ),
          ),

          Text(

            value,

            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}