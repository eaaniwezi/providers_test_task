// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
    @override
  void initState() {
    // hasAccessKey =
        Provider.of<ProductProviders>(context, listen: false).hasAccessKey();
        Provider.of<ProductProviders>(context, listen: false).isCategoryFetched();
    super.initState();
  } 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(
          title: 'Для лица',
        ),
      ),
    );
  }
}
