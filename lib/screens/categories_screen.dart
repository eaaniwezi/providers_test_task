// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';
import 'package:shop_test_task_with_providers/widgets/catergory_list_builder.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  // final CategoryModel categoryModel;

  // _CategoriesScreenState(this.categoryModel);
  @override
  void initState() {
    // hasAccessKey =

    // Provider.of<ProductProviders>(context, listen: false).hasAccessKey();
    // Provider.of<ProductProviders>(context, listen: false).loadCategory();
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
      body: Column(
        children: [
          ListTile(
            title: Text(
              "Все товары категории",
              style: TextStyle(
                color: Colors.red,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 15,
              ),
            ),
          ),
          Divider(color: Colors.black26),
          CategoryListBuilder(),
        ],
      ),
    );
  }
}
