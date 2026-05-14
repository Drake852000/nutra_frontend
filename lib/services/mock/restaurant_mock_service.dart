import '../../models/restaurant_model.dart';

class RestaurantMockService {

  Future<List<RestaurantModel>> getRestaurants() async {

    await Future.delayed(
      const Duration(seconds: 1),
    );

    return [

      RestaurantModel(
        id: 1,
        name: 'Healthy Food',
        imageUrl: 'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4',
        rating: 4.8,
        address: 'Arequipa, Perú',
      ),

      RestaurantModel(
        id: 2,
        name: 'Fit Meals',
        imageUrl: 'https://images.unsplash.com/photo-1552566626-52f8b828add9',
        rating: 4.7,
        address: 'Cayma, Arequipa',
      ),

      RestaurantModel(
        id: 3,
        name: 'Green Bowl',
        imageUrl: 'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
        rating: 4.9,
        address: 'Yanahuara, Arequipa',
      ),

      RestaurantModel(
        id: 4,
        name: 'NutriLife',
        imageUrl: 'https://images.unsplash.com/photo-1466978913421-dad2ebd01d17',
        rating: 4.6,
        address: 'Cerro Colorado, Arequipa',
      ),
    ];
  }
}