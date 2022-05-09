import 'dart:developer';

import 'package:towermarket_api_client/towermarket_api_client.dart';

class SubCategoryRepository {
  SubCategoryRepository({ApiClient? apiClient})
      : _apiClient = apiClient ?? ApiClient();

  final ApiClient _apiClient;
  Future<List<SubCategory>> getAllSubCategories() async {
    final fromApiClient = await _apiClient.getAll('sub_categories.json');
    log('-------+<>+----------------');
    log('-------+<$fromApiClient>+----------------');

    return fromApiClient
        .map((subCategory) => SubCategory.fromMap(subCategory))
        .toList();
  }
}
