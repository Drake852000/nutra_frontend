import '../models/restaurant_model.dart';
import '../services/api/restaurant_api_service.dart';

class RestaurantRepository {
  final RestaurantApiService apiService;

  RestaurantRepository(this.apiService);

  Future<List<RestaurantModel>> getRestaurants() {
    return apiService.getRestaurants();
  }
}