import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Views/CartPage/Widgets/ConfirmOrderWidget.dart';
import 'package:loja_do_real/Views/CartPage/Widgets/NoneProductInCartWidget.dart';
import 'package:loja_do_real/Views/CartPage/Widgets/ProductCardCartPageWidget.dart';

class CartPageView extends StatelessWidget {
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (_) => Container(
        padding: EdgeInsetsDirectional.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Carrinho",
              style: GoogleFonts.roboto(
                  fontSize: 32, fontWeight: FontWeight.w600, letterSpacing: 1),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: _productsController.productsInCart.length <= 0
                  ? noneProductInCartWidget()
                  : ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: _productsController.productsInCart.length,
                      itemBuilder: (_, _index) {
                        return productCardCartPageWidget(_productsController
                            .productsInCart
                            .elementAt(_index));
                      },
                    ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.roboto(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
                Text(
                  "R\$ ${_productsController.cartPrice.toStringAsFixed(2)}",
                  style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.red),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              child: Text('Finalizar pedido'),
              onPressed: () => Get.bottomSheet(confirmOrderWidget()),
              style: ElevatedButton.styleFrom(
                primary: Get.theme.accentColor,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
