// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_test_task_with_providers/models/basket_model.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/models/product_model.dart';
import 'package:shop_test_task_with_providers/services/product_services.dart';

class ProductProviders with ChangeNotifier {
  var log = Logger();
  List<CategoryModel> fetchedCategories = [];
  List<ProductModel> fetchedProducts = [];
  List<ProductModel> fetchedAllProducts = [];
  List<BasketModel> fetchedBasketProducts = [];
  final ProductServices _productServices = ProductServices();

  Future<void> initialize() async {
    await loadCategory();
    await loadAllProducts(limit: 5);
    await loadProducts(catergoryIdNum: "");
    await loadBasketProduct();
  }

  //*
  // Future<

//*
  Future loadCategory() async {
    final prefs = await SharedPreferences.getInstance();

    final getList = await prefs.getString("list");

    if (getList == null) {
      fetchedCategories = await _productServices.fetchAllCategories();
    } else {
      fetchedCategories = await _productServices.fetchSavedCategories();
    }

    notifyListeners();
  }

//*
  Future loadProducts({required String catergoryIdNum}) async {
    fetchedProducts =
        await _productServices.fetchProducts(categoryIdNumber: catergoryIdNum);
    notifyListeners();
  }

//*
  Future loadAllProducts({required int limit}) async {
    fetchedAllProducts = await _productServices.fetchAllProducts(limit: limit);
    notifyListeners();
  }

//*
  Future<bool> isAdded(
      {required String productId, required String quantity}) async {
    bool isProductAdded = await _productServices.addToCart(
        productId: productId, quantity: quantity);
    if (isProductAdded == true) {
      fetchedBasketProducts = await _productServices.fetchBasketItems();
      notifyListeners();
      return true;
    } else {
      notifyListeners();
      return false;
    }
  }

//*
  Future loadBasketProduct() async {
    fetchedBasketProducts = await _productServices.fetchBasketItems();
    notifyListeners();
  }

//!not needed
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
