// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shop_test_task_with_providers/services/product_services.dart';

class ProductProviders with ChangeNotifier {
  final ProductServices _productServices = ProductServices();

  Future<bool> hasAccessKey() async {
    try {
      await _productServices.getUserAccessKey();
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      notifyListeners();
      return false;
    }
  }

  Future<bool> isCategoryFetched() async {
    try {
      await _productServices.fetchAllCategories();
      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      notifyListeners();
      return false;
    }
  }
}
