import '../../core/network/api_client.dart';
import '../../models/product_model.dart';

class ProductApiService {
  final ApiClient _client = ApiClient();

  static const String baseUrl =
      "http://10.0.2.2:5191/Catalog/meals";

  Future<List<ProductModel>> getProducts() async {
    final response = await _client.get(baseUrl);

    if (response == null) return [];

    if (response is List) {
      return response
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }

    // por si backend envía { data: [...] }
    if (response is Map && response["data"] is List) {
      return (response["data"] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
    }

    throw Exception("Formato inesperado en /Catalog/meals");
  }
}