// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
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
            physics: const ClampingScrollPhysics(),
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

class ProductView extends StatefulWidget {
  final ProductModel productModel;
  const ProductView({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: AspectRatio(
                    aspectRatio: 16,
                    child: Hero(
                      tag: widget.productModel.id,
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: widget.productModel.image!.file!.url,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: SvgPicture.asset(
                    "icons/heart.svg",
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              children: [
                Text(
                  NumberFormat.decimalPattern()
                          .format(widget.productModel.price) +
                      " ₽",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Spacer(),
                InkWell(
                  onTap: () async {
                    var quantity = '1';
                    final productProvider =
                        Provider.of<ProductProviders>(context, listen: false);
                    bool successfullAdded = await productProvider.isAdded(
                      productId: widget.productModel.id.toString(),
                      quantity: quantity,
                    );

                    if (successfullAdded) {
                      Fluttertoast.showToast(msg: "Успешно добавленный!");
                    } else {
                      Fluttertoast.showToast(
                          msg: "Ошибка при добавлении в корзину");
                    }
                  },
                  child: SvgPicture.asset(
                    "icons/cart.svg",
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.productModel.title,
          ),
        ],
      ),
    );
  }
}
