import '../models/product_model.dart';
import '../services/api/product_api_service.dart';

class ProductRepository {
  final ProductApiService api;

  ProductRepository(this.api);

  Future<List<ProductModel>> getProducts() {
    return api.getProducts();
  }
}