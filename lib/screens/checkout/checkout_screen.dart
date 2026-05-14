import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {

  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final cartProvider =
        context.watch<CartProvider>();

    return Scaffold(

      appBar: AppBar(
        title: const Text('Checkout'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            Expanded(

              child: SingleChildScrollView(

                child: Column(

                  crossAxisAlignment:
                      CrossAxisAlignment.start,

                  children: [

                    // DELIVERY ADDRESS

                    const Text(

                      'Dirección de entrega',

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(

                      padding:
                          const EdgeInsets.all(16),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(16),
                      ),

                      child: const Row(

                        children: [

                          Icon(Icons.location_on),

                          SizedBox(width: 12),

                          Expanded(

                            child: Text(
                              'Av. Ejército 123, Arequipa',
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),

                    // PAYMENT METHOD

                    const Text(

                      'Método de pago',

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    _paymentMethod(
                      Icons.credit_card,
                      'Tarjeta',
                    ),

                    _paymentMethod(
                      Icons.phone_android,
                      'Yape',
                    ),

                    _paymentMethod(
                      Icons.account_balance_wallet,
                      'Plin',
                    ),

                    _paymentMethod(
                      Icons.money,
                      'Efectivo',
                    ),

                    const SizedBox(height: 32),

                    // ORDER SUMMARY

                    const Text(

                      'Resumen del pedido',

                      style: TextStyle(
                        fontSize: 20,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 16),

                    ...cartProvider.items.map(

                      (item) {

                        return Padding(

                          padding:
                              const EdgeInsets.only(
                            bottom: 12,
                          ),

                          child: Row(

                            mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,

                            children: [

                              Expanded(

                                child: Text(
                                  '${item.product.name} x${item.quantity}',
                                ),
                              ),

                              Text(
                                'S/ ${(item.product.price * item.quantity).toStringAsFixed(2)}',
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const Divider(height: 32),

                    _summaryRow(
                      'Subtotal',
                      'S/ ${cartProvider.totalPrice.toStringAsFixed(2)}',
                    ),

                    _summaryRow(
                      'Delivery',
                      'S/ 5.00',
                    ),

                    const SizedBox(height: 16),

                    _summaryRow(
                      'Proteínas',
                      '${cartProvider.totalProtein}g',
                    ),

                    _summaryRow(
                      'Carbs',
                      '${cartProvider.totalCarbs}g',
                    ),

                    _summaryRow(
                      'Grasas',
                      '${cartProvider.totalFat}g',
                    ),

                    _summaryRow(
                      'Calorías',
                      '${cartProvider.totalCalories} kcal',
                    ),

                    const Divider(height: 32),

                    _summaryRow(
                      'TOTAL',
                      'S/ ${(cartProvider.totalPrice + 5).toStringAsFixed(2)}',
                      isTotal: true,
                    ),
                  ],
                ),
              ),
            ),

            // BUTTON

            SizedBox(

              width: double.infinity,

              child: ElevatedButton(

                onPressed: () {

                  // CLEAR CART

                  cartProvider.clearCart();

                  // SHOW SUCCESS

                  showDialog(

                    context: context,

                    builder: (_) {

                      return AlertDialog(

                        title: const Text(
                          'Pedido confirmado',
                        ),

                        content: const Text(
                          'Tu pedido fue realizado exitosamente.',
                        ),

                        actions: [

                          TextButton(

                            onPressed: () {

                              Navigator.of(context)
                                  .popUntil(
                                    (route) => route.isFirst,
                                  );
                            },

                            child: const Text(
                              'Aceptar',
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },

                child: const Text(
                  'Confirmar pedido',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _paymentMethod(
    IconData icon,
    String title,
  ) {

    return Container(

      margin: const EdgeInsets.only(
        bottom: 12,
      ),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color: Colors.white,

        borderRadius:
            BorderRadius.circular(16),
      ),

      child: Row(

        children: [

          Icon(icon),

          const SizedBox(width: 12),

          Text(
            title,
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String title,
    String value, {
    bool isTotal = false,
  }) {

    return Padding(

      padding: const EdgeInsets.only(
        bottom: 12,
      ),

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
              fontWeight: isTotal
                  ? FontWeight.bold
                  : FontWeight.normal,

              fontSize: isTotal ? 18 : 16,
            ),
          ),
        ],
      ),
    );
  }
}