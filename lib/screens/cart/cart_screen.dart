import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

import '../checkout/checkout_screen.dart';

class CartScreen extends StatelessWidget {

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartProvider =
        context.watch<CartProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text('Carrito'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            // EMPTY CART

            if (cartProvider.items.isEmpty)

              const Expanded(

                child: Center(

                  child: Text(

                    'Tu carrito está vacío',

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              )

            else

              Expanded(

                child: ListView.builder(

                  itemCount:
                      cartProvider.items.length,

                  itemBuilder:
                      (context, index) {

                    final item =
                        cartProvider.items[index];

                    return Card(

                      margin:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),

                      child: Padding(

                        padding:
                            const EdgeInsets.all(
                          12,
                        ),

                        child: Row(

                          children: [

                            // IMAGE

                            ClipRRect(

                              borderRadius:
                                  BorderRadius
                                      .circular(12),

                              child: Image.network(

                                item.product.imageUrl,

                                width: 80,
                                height: 80,

                                fit: BoxFit.cover,
                              ),
                            ),

                            const SizedBox(width: 16),

                            // INFO

                            Expanded(

                              child: Column(

                                crossAxisAlignment:
                                    CrossAxisAlignment
                                        .start,

                                children: [

                                  Text(

                                    item.product.name,

                                    style:
                                        const TextStyle(
                                      fontWeight:
                                          FontWeight
                                              .bold,

                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(
                                    height: 8,
                                  ),

                                  // QUANTITY CONTROLS

                                  Row(

                                    children: [

                                      IconButton(

                                        onPressed: () {

                                          context
                                              .read<CartProvider>()
                                              .decreaseQuantity(
                                                item.product,
                                              );
                                        },

                                        icon: const Icon(
                                          Icons.remove_circle_outline,
                                        ),
                                      ),

                                      Text(

                                        '${item.quantity}',

                                        style:
                                            const TextStyle(
                                          fontWeight:
                                              FontWeight.bold,

                                          fontSize: 16,
                                        ),
                                      ),

                                      IconButton(

                                        onPressed: () {

                                          context
                                              .read<CartProvider>()
                                              .increaseQuantity(
                                                item.product,
                                              );
                                        },

                                        icon: const Icon(
                                          Icons.add_circle_outline,
                                        ),
                                      ),
                                    ],
                                  ),

                                  Text(
                                    '${item.product.calories} kcal',
                                  ),
                                ],
                              ),
                            ),

                            // PRICE

                            Column(

                              crossAxisAlignment:
                                  CrossAxisAlignment.end,

                              children: [

                                Text(

                                  'S/ ${(item.product.price * item.quantity).toStringAsFixed(2)}',

                                  style:
                                      const TextStyle(
                                    fontWeight:
                                        FontWeight.bold,

                                    fontSize: 16,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                IconButton(

                                  onPressed: () {

                                    context
                                        .read<CartProvider>()
                                        .removeFromCart(
                                          item.product,
                                        );
                                  },

                                  icon: const Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

            // SUMMARY

            if (cartProvider.items.isNotEmpty) ...[

              const SizedBox(height: 16),

              Card(

                child: Padding(

                  padding:
                      const EdgeInsets.all(16),

                  child: Column(

                    children: [

                      _infoRow(
                        'Proteínas',
                        '${cartProvider.totalProtein}g',
                      ),

                      _infoRow(
                        'Carbohidratos',
                        '${cartProvider.totalCarbs}g',
                      ),

                      _infoRow(
                        'Grasas',
                        '${cartProvider.totalFat}g',
                      ),

                      _infoRow(
                        'Calorías',
                        '${cartProvider.totalCalories} kcal',
                      ),

                      const Divider(),

                      _infoRow(
                        'TOTAL',
                        'S/ ${cartProvider.totalPrice.toStringAsFixed(2)}',
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // CHECKOUT BUTTON

              SizedBox(

                width: double.infinity,

                child: ElevatedButton(

                  onPressed: () {

                    Navigator.push(

                      context,

                      MaterialPageRoute(

                        builder: (_) =>
                            const CheckoutScreen(),
                      ),
                    );
                  },

                  child: const Text(
                    'Proceder al pago',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _infoRow(
    String title,
    String value, {
    bool isTotal = false,
  }) {

    return Padding(

      padding:
          const EdgeInsets.only(bottom: 12),

      child: Row(

        mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

        children: [

          Text(

            title,

            style: TextStyle(

              fontWeight: isTotal
                  ? FontWeight.bold
                  : FontWeight.normal,

              fontSize: isTotal ? 18 : 16,
            ),
          ),

          Text(

            value,

            style: TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: isTotal ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}