import '../services/api/restaurant_api_service.dart';
import '../models/restaurant_model.dart';
import '../models/meal_model.dart';

class RestaurantRepository {
  final RestaurantApiService apiService;

  RestaurantRepository(this.apiService);

  Future<List<RestaurantModel>> getRestaurants() {
    return apiService.getRestaurants();
  }

  Future<List<MealModel>> getMenu(String restaurantId) {
    return apiService.getMenu(restaurantId);
  }
}