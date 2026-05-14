import '../models/product_model.dart';
import '../services/mock/product_mock_service.dart';

class ProductRepository {

  final ProductMockService mockService;

  ProductRepository(this.mockService);

  Future<List<ProductModel>> getProducts() {

    return mockService.getProducts();
  }
}