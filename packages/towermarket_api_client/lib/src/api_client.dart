import 'dart:convert';

import 'package:flutter/services.dart';

class ApiClient {
  Future<List<dynamic>> getAll(String path) async {
    final fromApi =
        await _loadAsset('packages/towermarket_repository/json/$path');
    return json.decode(fromApi) as List<dynamic>;
  }

  // Load Asset
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
