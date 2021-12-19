import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_test_task_with_providers/models/product_model.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';

class ProductListBuilder extends StatelessWidget {
  const ProductListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProviders>(context, listen: false);
    return productProvider.fetchedProducts.isNotEmpty
        ? GridView.count(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: productProvider.fetchedProducts
                .map((item) => ProductView(
                      productModel: item,
                    ))
                .toList(),
          )
        : const Center(
            child: Text(
              "Error fetching Data",
              style: TextStyle(color: Colors.black),
            ),
          );
  }
}

class ProductView extends StatelessWidget {
  final ProductModel productModel;
  const ProductView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(child: Text(productModel.price.toString()),);
  }
}
