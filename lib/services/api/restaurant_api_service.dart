import '../../core/network/api_client.dart';
import '../../models/restaurant_model.dart';

class RestaurantApiService {
  final ApiClient _client = ApiClient();

  static const String baseUrl =
      "http://10.0.2.2:5191/Catalog/restaurants";

  Future<List<RestaurantModel>> getRestaurants() async {
    final response = await _client.get(baseUrl);

    final list = response as List;

    return list
        .map((e) => RestaurantModel.fromJson(e))
        .toList();
  }
}