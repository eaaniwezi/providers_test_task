// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:shop_test_task_with_providers/models/category_model.dart';
import 'package:shop_test_task_with_providers/widgets/app_bar_widget.dart';
import 'package:shop_test_task_with_providers/widgets/product_list_builder.dart';

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
          isIcon: true,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: ListView(
          children: [
            Container(
              height: 48,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          "icons/filter.svg",
                        ),
                        SizedBox(width: 3),
                        Text(
                          "фильтры",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "icons/sorting.svg",
                        ),
                        SizedBox(width: 3),
                        Text(
                          "По популярности",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: TabBarView(
                children: [
                 ProductListBuilder(),
                  Center(
                    child: Text(
                      "По популярности",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
