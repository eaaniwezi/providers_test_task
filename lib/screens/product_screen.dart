// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';

class ProductScreen extends StatelessWidget {
  CategoryModel categoryModel;
  ProductScreen({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(
          title: categoryModel.title,
          isNavigate: true,
        ),
      ),
    );
  }
}
