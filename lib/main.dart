import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';

import 'providers/product_provider.dart';
import 'providers/restaurant_provider.dart';
import 'providers/cart_provider.dart';
import 'providers/user_provider.dart';

import 'repositories/product_repository.dart';
import 'repositories/restaurant_repository.dart';
import 'repositories/user_repository.dart';

import 'services/mock/product_mock_service.dart';
import 'services/mock/restaurant_mock_service.dart';
import 'services/mock/user_mock_service.dart';

import 'screens/main_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(

      providers: [

        ChangeNotifierProvider(

          create: (_) => ProductProvider(

            ProductRepository(
              ProductMockService(),
            ),
          ),
        ),

        ChangeNotifierProvider(

          create: (_) => RestaurantProvider(

            RestaurantRepository(
              RestaurantMockService(),
            ),
          ),
        ),

        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),

        ChangeNotifierProvider(

          create: (_) => UserProvider(

            UserRepository(
              UserMockService(),
            ),
          ),
        ),
      ],

      child: MaterialApp(

        debugShowCheckedModeBanner: false,

        title: 'Healthy Food',

        theme: AppTheme.lightTheme,

        home: const MainScreen(),
      ),
    );
  }
}