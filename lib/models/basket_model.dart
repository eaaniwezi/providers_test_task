import 'package:shop_test_task_with_providers/models/product_model.dart';

class BasketModel {
  int id;
  int price;
  int quantity;
  ProductModel? productModel;

  BasketModel({
    required this.id,
    required this.price,
    required this.quantity,
    required this.productModel,
  });
  factory BasketModel.fromJson(Map<String, dynamic> responseData) {
    return BasketModel(
      id: responseData['id'],
      price: responseData['price'],
      quantity: responseData['quantity'],
      productModel: responseData['product'] != null
          ? ProductModel.fromJson(responseData['product'])
          : null,
    );
  }
}
