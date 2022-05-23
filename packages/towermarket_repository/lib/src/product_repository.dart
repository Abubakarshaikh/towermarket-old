import 'package:towermarket_api_client/towermarket_api_client.dart';

class ProductRepository {
  ProductRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<List<Product>> getAllProductsByCategoryId([String id = "1"]) async {
    final fromApiClient = await _apiClient.getAll('products.json');
    return fromApiClient
        .map((product) => Product.fromMap(product))
        .where((product) => product.categoryId == id)
        .toList();
  }
}
