// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/services/api_endpoints.dart';

class ProductServices {
  var log = Logger();
  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<String> getUserAccessKey() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.accessKey),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      },
    );
    final accessKey = jsonDecode(response.body);
    final key = accessKey['accessKey'];
    //*storing the access-key
    await storage.write(key: 'accessKey', value: key);
    log.d(accessKey);
    return key;
  }

  Future<List<CategoryModel>> fetchAllCategories() async {
    final response = await http.get(
      Uri.parse(ApiEndpoints.categoryList),
      headers: {
        "Accept": "application/json",
        "Content-Type": 'application/json'
      },
    ); 
    var dataa = jsonDecode(response.body);

    var data = dataa['items'];
    log.d(dataa);
    log.d(data);


    List<CategoryModel> _categoriesList = [];

    for (var fetchedList in data) {
      CategoryModel _categoryModel = CategoryModel.fromJson(fetchedList);
      _categoriesList.add(_categoryModel);
    }


    return _categoriesList;
    // return data['items'];
  }
}
