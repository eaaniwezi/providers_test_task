// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/services/product_services.dart';

class ProductProviders with ChangeNotifier {
  List<CategoryModel> fetchedCategories = [];
  final ProductServices _productServices = ProductServices();

  ProductProviders.initialize() {
    loadCategory();
  }

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

  loadCategory() async {
     fetchedCategories = await _productServices.fetchAllCategories();
    notifyListeners();
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
