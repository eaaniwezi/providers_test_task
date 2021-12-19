import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/providers/product_providers.dart';

class CategoryListBuilder extends StatelessWidget {
  const CategoryListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProviders>(context, listen: false);
    return ListView.separated(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: productProvider.fetchedCategories.length,
      separatorBuilder: (BuildContext context, int index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Divider(
          color: Colors.black26,
        ),
      ),
      itemBuilder: (BuildContext context, int index) {
        return CategoryView(
          categoryModel: productProvider.fetchedCategories[index],
        );
      },
    );
  }
}

class CategoryView extends StatelessWidget {
  final CategoryModel categoryModel;
  const CategoryView({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        print("object");
      },
      title: Text(
        categoryModel.title,
      ),
      trailing: IconButton(
        onPressed: () {
          print(categoryModel.title);
        },
        icon: const Icon(
          Icons.arrow_forward_ios_outlined,
          size: 15,
        ),
      ),
    );
  }
}
