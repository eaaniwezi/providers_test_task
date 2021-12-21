// ignore_for_file: unnecessary_new, prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_test_task_with_providers/models/basket_model.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/models/product_model.dart';
import 'package:shop_test_task_with_providers/services/api_endpoints.dart';

class ProductServices {
  var log = Logger();
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<List<CategoryModel>> fetchAllCategories() async {
    final prefs = await SharedPreferences.getInstance();

    final response = await http.get(
      Uri.parse(ApiEndpoints.categoryList),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      },
    );
    var dataa = jsonDecode(response.body);
    var data = dataa['items'];

    List<CategoryModel> _categoriesList = [];

    for (var fetchedList in data) {
      CategoryModel _categoryModel = CategoryModel.fromJson(fetchedList);
      _categoriesList.add(_categoryModel);
    }

    final _set = _categoriesList.toSet().toList();

    //  await prefs.setStringList('savedCategoryList', _set)

    return _categoriesList;
  }

  Future<List<ProductModel>> fetchProducts(
      {required String categoryIdNumber}) async {
    final response = await http.get(
      Uri.parse(
          "https://vue-study.skillbox.cc/api/products?categoryId=$categoryIdNumber"),
      // Uri.parse(ApiEndpoints.product + "?categoryId=" + categoryIdNumber),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      },
    );
    var dataa = jsonDecode(response.body);
    var data = dataa['items'];

    List<ProductModel> _productList = [];

    for (var fetchedProductList in data) {
      ProductModel _productModel = ProductModel.fromJson(fetchedProductList);
      _productList.add(_productModel);
    }

    return _productList;
  }

  Future<List<ProductModel>> fetchAllProducts({required int limit}) async {

    final response = await http.get(
      Uri.parse("https://vue-study.skillbox.cc/api/products?limit=$limit"),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      },
    );
    var dataa = jsonDecode(response.body);
    var data = dataa['items'];

    List<ProductModel> _productList = [];

    for (var fetchedProductList in data) {
      ProductModel _productModel = ProductModel.fromJson(fetchedProductList);
      _productList.add(_productModel);
    }

    return _productList;
  }

  Future<bool> addToCart(
      {required String productId, required String quantity}) async {
    Map cartRequirement = {
      "productId": productId,
      "quantity": quantity,
    };

    var savedAccessKey = await storage.read(key: "accessKey");
    print(savedAccessKey);

    try {
      if (savedAccessKey == null) {
        final response = await http.get(
          Uri.parse(ApiEndpoints.accessKey),
          headers: {
            "Accept": "application/json",
            "Content-Type": 'application/json'
          },
        );
        final accessKey = jsonDecode(response.body);
        savedAccessKey = accessKey['accessKey'];
        //*storing the access-key
        await storage.write(key: 'accessKey', value: savedAccessKey);
      }
      final response = await http.post(
        Uri.parse(ApiEndpoints.addToCart + savedAccessKey!),
        headers: {
          "Accept": "application/json",
          "Content-Type": 'application/json',
        },
        body: json.encode(cartRequirement),
      );
      print(response.statusCode.toString() + "..statusCode.toString()");
      if (response.statusCode == 200 || response.statusCode == 201) {
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  Future<List<BasketModel>> fetchBasketItems() async {
    var savedAccessKey = await storage.read(key: "accessKey");
    print(savedAccessKey);

    if (savedAccessKey == null) {
      final response = await http.get(
        Uri.parse(ApiEndpoints.accessKey),
        headers: {
          "Accept": "application/json",
          "Content-Type": 'application/json'
        },
      );
      final accessKey = jsonDecode(response.body);
      savedAccessKey = accessKey['accessKey'];
      //*storing the access-key
      await storage.write(key: 'accessKey', value: savedAccessKey);
    }
    final response = await http.get(
      Uri.parse(ApiEndpoints.cartList + savedAccessKey!),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json',
      },
    );
    print(response.statusCode.toString() + "..statusCode.toStbasketring()");
    var dataa = jsonDecode(response.body);
    var data = dataa['items'];

    List<BasketModel> _basketProductList = [];

    for (var fetchedBasketProductList in data) {
      BasketModel _basketModel = BasketModel.fromJson(fetchedBasketProductList);
      _basketProductList.add(_basketModel);
    }
    return _basketProductList;
  }
}
