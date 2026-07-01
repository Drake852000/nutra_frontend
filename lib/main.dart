import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/auth/login_screen.dart';
import 'screens/auth/register_screen.dart';
import 'screens/main_screen.dart';

import 'providers/cart_provider.dart';
import 'providers/product_provider.dart';
import 'providers/restaurant_provider.dart';
import 'providers/user_provider.dart';
import 'providers/menu_provider.dart';

import 'repositories/product_repository.dart';
import 'repositories/restaurant_repository.dart';

import 'services/api/product_api_service.dart';
import 'services/api/restaurant_api_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        // 🛒 CART
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

        // 🍽 PRODUCTS
        ChangeNotifierProvider(
          create: (_) => ProductProvider(
            ProductRepository(ProductApiService()),
          ),
        ),

        // 🏪 RESTAURANTS
        ChangeNotifierProvider(
          create: (_) => RestaurantProvider(
            RestaurantRepository(RestaurantApiService()),
          ),
        ),

        // 👤 USER PROFILE
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),

        // 🍜 MENU (IMPORTANTE PARA RESTAURANTE DETAIL)
        ChangeNotifierProvider(
          create: (_) => MenuProvider(),
        ),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        initialRoute: "/login",

        routes: {
          "/login": (context) => const LoginScreen(),
          "/register": (context) => const RegisterScreen(),
          "/home": (context) => const MainScreen(),
        },
      ),
    );
  }
}