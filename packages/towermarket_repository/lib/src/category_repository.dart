import 'package:towermarket_api_client/towermarket_api_client.dart';

class CategoryRepository {
  CategoryRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<List<Category>> getAllCategories() async {
    final fromApiClient = await _apiClient.getAll('categories.json');
    return fromApiClient.map((category) => Category.fromMap(category)).toList();
  }
}
