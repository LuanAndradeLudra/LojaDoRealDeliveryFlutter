import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/CategoryCardWidget.dart';

final ProductsController _productsController = Get.find();

Widget categoriesListWidget() => new Container(
  height: 90,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: _productsController.categoriesList.length,
    itemBuilder: (_, index) {
      return Row(
        children: [
          categoryCardWidget(_productsController.categoriesList.elementAt(index)),
          SizedBox(width: 10,)
        ],
      );
    },
  ),
);