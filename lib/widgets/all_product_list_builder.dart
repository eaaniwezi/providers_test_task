import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/widgets/product_list_builder.dart';

class AllProductListBuilder extends StatefulWidget {
  const AllProductListBuilder({Key? key}) : super(key: key);

  @override
  State<AllProductListBuilder> createState() => _AllProductListBuilderState();
}

class _AllProductListBuilderState extends State<AllProductListBuilder> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProviders>(context, listen: false);
    return productProvider.fetchedAllProducts.isNotEmpty
        ? GridView.count(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          primary: false,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: productProvider.fetchedAllProducts
              .map((item) => ProductView(
                    productModel: item,
                  ))
              .toList(),
        )
        : productProvider.fetchedAllProducts.isEmpty
            ? const Center(
                child: Text(
                  "Error fetching Data",
                  style: TextStyle(color: Colors.black),
                ),
              )
            : const Center(
                child: Text(
                  "No Category Product List",
                  style: TextStyle(color: Colors.black),
                ),
              );
  }
}
