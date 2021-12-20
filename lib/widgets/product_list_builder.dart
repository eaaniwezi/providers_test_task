// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  // color: Colors.red,
                  height: MediaQuery.of(context).size.height * 0.4,
                  // child: ClipRRect(child: Image.asset,),
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
          // Text(widget.productModel.image!.file!.url),
          Row(
            children: [
              Text(
                NumberFormat.decimalPattern()
                        .format(widget.productModel.price) +
                    " ₽",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Spacer(),
              SvgPicture.asset(
                "icons/cart.svg",
              ),
            ],
          ),
          Text(
            widget.productModel.title,
          ),
        ],
      ),
    );
  }
}
