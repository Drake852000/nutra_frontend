import '../models/product_model.dart';
import '../services/api/product_api_service.dart';

class ProductRepository {
  final ProductApiService apiService;

  ProductRepository(this.apiService);

  Future<List<ProductModel>> getProducts() {
    return apiService.getProducts();
  }
}