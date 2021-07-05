import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'ProductsListPageView.dart';
import 'package:loja_do_real/Views/ProductsPage/ProductPageView.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/FloatingButtonProductsWidget.dart';

class ProductsPageView extends StatelessWidget {

  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductsController>(
        builder: (_) => _productsController.activeProduct.name == "" ? productsListPageView() : productPageView(),
      ),
      floatingActionButton: floatingButtonFoodPageWidget(),
    );
  }
}