import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/ProductCardWidget.dart';

final ProductsController _productsController = Get.find();

Widget productsListWidget() => GetBuilder<ProductsController>(
  builder: (_) => ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: _productsController.productsListActive.length,
      itemBuilder: (_, index) {
        return productCardWidget(_productsController.productsListActive.elementAt(index));
      }),
);
