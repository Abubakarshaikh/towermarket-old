import 'package:towermarket/api_client/api_client.dart';
import 'package:towermarket/models/category.dart';

class CategoryRepository {
  CategoryRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<List<Category>> getAllProducts() async {
    final fromApiClient = await _apiClient.getAll('categories.json');
    return fromApiClient.map((category) => Category.fromMap(category)).toList();
  }
}
