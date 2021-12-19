// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/models/product_model.dart';
import 'package:shop_test_task_with_providers/services/product_services.dart';

class ProductProviders with ChangeNotifier {
  var log = Logger();
  List<CategoryModel> fetchedCategories = [];
  List<ProductModel> fetchedProducts = [];
  final ProductServices _productServices = ProductServices();

  ProductProviders.initialize() {
    loadCategory();
    loadProducts(catergoryIdNum: "");
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

  Future loadProducts({required String catergoryIdNum}) async {
    fetchedProducts =
        await _productServices.fetchProducts(categoryIdNumber: catergoryIdNum);
    print(fetchedProducts.length.toString() + " this is the fetchedProduct");
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
