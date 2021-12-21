// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/widgets/all_product_list_builder.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';

class AllProductScreen extends StatefulWidget {
  const AllProductScreen({Key? key}) : super(key: key);

  @override
  State<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(
          title: "Все товары категории",
          isNavigate: true,
          isIcon: true,
        ),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        // enablePullUp: true,
        header: WaterDropHeader(),
        onRefresh: () => _onRefresh(context),
        onLoading: _onLoading,
        child: ListView(
          children: [
            AllProductListBuilder(),
          ],
        ),
      ),
    );
  }

  void _onRefresh(BuildContext context) async {
    int currentLimit = 100;
    final productProvider =
        Provider.of<ProductProviders>(context, listen: false);
    await productProvider.loadAllProducts(limit: ++currentLimit);
    _refreshController.refreshCompleted();
    print("started refreshing");
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    CircularProgressIndicator();
    if (mounted) setState(() {});
    print("loading");
    _refreshController.loadComplete();
  }

  @override
  void dispose() {
     _refreshController.dispose();
    super.dispose();
  }
}
