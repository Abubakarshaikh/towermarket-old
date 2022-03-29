import 'package:towermarket/api_client/api_client.dart';
import 'package:towermarket/models/product.dart';

class ProductsRepository {
  ProductsRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<List<Product>> getAllProducts() async {
    final fromApiClient = await _apiClient.getAll('products.json');
    return fromApiClient.map((product) => Product.fromMap(product)).toList();
  }
}
