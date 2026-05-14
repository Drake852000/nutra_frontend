import '../../../../../models/product_model.dart';

class ProductMockService {

  Future<List<ProductModel>> getProducts() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [

      ProductModel(
        id: 1,
        name: 'Pollo con arroz integral',
        description: 'Alto en proteína',
        price: 24.90,
        protein: 35,
        carbs: 40,
        fat: 10,
        calories: 420,
        imageUrl: 'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
        restaurantId: 1,
        category: 'Fitness',
      ),

      ProductModel(
        id: 2,
        name: 'Ensalada César Fit',
        description: 'Baja en calorías',
        price: 18.50,
        protein: 20,
        carbs: 15,
        fat: 8,
        calories: 250,
        imageUrl: 'https://images.unsplash.com/photo-1547592180-85f173990554',
        restaurantId: 1,
        category: 'Healthy',
      ),

      ProductModel(
        id: 3,
        name: 'Salmón con vegetales',
        description: 'Rico en omega 3',
        price: 32.90,
        protein: 40,
        carbs: 18,
        fat: 14,
        calories: 480,
        imageUrl: 'https://images.unsplash.com/photo-1467003909585-2f8a72700288',
        restaurantId: 2,
        category: 'Keto',
      ),

      ProductModel(
        id: 4,
        name: 'Bowl de quinoa',
        description: 'Ideal para dieta saludable',
        price: 21.90,
        protein: 18,
        carbs: 35,
        fat: 9,
        calories: 340,
        imageUrl: 'https://images.unsplash.com/photo-1512058564366-18510be2db19',
        restaurantId: 2,
        category: 'Vegano',
      ),

      ProductModel(
        id: 5,
        name: 'Wrap fitness de pollo',
        description: 'Perfecto para definición',
        price: 19.90,
        protein: 28,
        carbs: 22,
        fat: 7,
        calories: 310,
        imageUrl: 'https://images.unsplash.com/photo-1529042410759-befb1204b468',
        restaurantId: 1,
        category: 'Fitness',
      ),
    ];
  }
}