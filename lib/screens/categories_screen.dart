// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_test_task_with_providers/screens/all_product_screen.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';
import 'package:shop_test_task_with_providers/widgets/catergory_list_builder.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBarWidget(
          title: 'Для лица',
          isNavigate: false,
          isIcon: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AllProductScreen())),
              title: Text(
                "Все товары категории",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AllProductScreen()));
                },
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
      ),
    );
  }
}
