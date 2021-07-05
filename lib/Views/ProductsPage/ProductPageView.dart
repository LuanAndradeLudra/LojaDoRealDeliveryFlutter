import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/BannerProductWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/QuantityButtonsProduct.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/descriptionProductWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/RelatedListProductsWidget.dart';

final ProductsController _productsController = Get.find();
final ScreenController _screenController = Get.find();

Widget productPageView() => Container(
  child: Scaffold(
    body: SingleChildScrollView(
      physics: ScrollPhysics(),
      controller: _screenController.relatedListScrollController,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bannerProductWidget(),
          SizedBox(
            height: 16,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                descriptionProductWidget(),
                SizedBox(
                  height: 16,
                ),
                quantityButtonsFoodPageWidget(),
                relatedListProductsFoodPageWidget(_productsController.activeProduct.id),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);
