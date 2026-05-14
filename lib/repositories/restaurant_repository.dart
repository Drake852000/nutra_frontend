import '../models/restaurant_model.dart';
import '../services/mock/restaurant_mock_service.dart';

class RestaurantRepository {

  final RestaurantMockService mockService;

  RestaurantRepository(this.mockService);

  Future<List<RestaurantModel>> getRestaurants() {

    return mockService.getRestaurants();
  }
}