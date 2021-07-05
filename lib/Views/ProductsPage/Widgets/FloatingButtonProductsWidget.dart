import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';

final ProductsController _productsController = Get.find();
final ScreenController _screenController = Get.find();

Widget floatingButtonFoodPageWidget() => ElevatedButton(
  onPressed: () => _screenController.setHomePageNavigationIndex(2),
  child: Badge(
    badgeColor: Colors.white,
    badgeContent: GetBuilder<ProductsController>(
      builder: (_) => Text(
        _productsController.quantityProductsInCart.toString(),
        style: TextStyle(color: Get.theme.primaryColor),
      ),
    ),
    child: Icon(
      Icons.shopping_bag,
      color: Colors.white,
    ),
  ),
  style: ElevatedButton.styleFrom(
    side: BorderSide(
      width: 3.0,
      color: Colors.white,
    ),
    shape: CircleBorder(),
    padding: EdgeInsets.all(20),
    primary: Get.theme.primaryColor, // <-- Button color
    onPrimary: Get.theme.primaryColor, // <-- Splash color
  ),
);