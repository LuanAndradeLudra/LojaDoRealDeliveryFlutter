import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/ProductCardWidget.dart';

final ProductsController _productsController = Get.find();

Widget relatedListProductsFoodPageWidget(int myProduct) => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "Produtos relacionados",
      style: GoogleFonts.roboto(
          fontSize: 30,
          fontWeight: FontWeight.w500,
          color: Colors.grey[900]),
    ),
    SizedBox(
      height: 16,
    ),
    ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: _productsController.productsListActive.length,
        itemBuilder: (_, index) {
          return myProduct !=
              _productsController.productsListActive.elementAt(index).id
              ? productCardWidget(
              _productsController.productsListActive.elementAt(index))
              : Container();
        }),
  ],
);
