import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';
import 'package:vibration/vibration.dart';

final ProductsController _productsController= Get.find();

Widget quantityButtonsCartPageWidget(ProductCartModel _product) => Row(
  children: [
    ElevatedButton(
      onPressed: () {},
      child: Row(
        children: [
          GestureDetector(
            child: Text(
              "-",
              style: TextStyle(
                  color: Colors.grey, fontSize: 30),
            ),
            onTap: (){
              if (_product.quantity - 1 > 0){
                Vibration.vibrate(duration: 100);
                _product.quantity -= 1;
                _product.total = _product.quantity * _product.product.price;
                _productsController.setCartPrice(_productsController.cartPrice - _product.product.price);
                _productsController.setQuantityProductsInCart(_productsController.quantityProductsInCart - 1);
              }
            },
          ),
          SizedBox(
            width: 16,
          ),
          Text(
            _product.quantity.toString(),
            style:
            TextStyle(color: Colors.grey, fontSize: 16),
          ),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            child: Text(
              "+",
              style: TextStyle(
                  color: Colors.grey, fontSize: 20),
            ),
            onTap: () {
              Vibration.vibrate(duration: 100);
              _product.quantity += 1;
              _product.total = _product.quantity * _product.product.price;
              _productsController.setCartPrice(_productsController.cartPrice + _product.product.price);
              _productsController.setQuantityProductsInCart(_productsController.quantityProductsInCart + 1);
            },
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          width: 1.0,
          color: Colors.grey,
        ),
        primary: Colors.white,
        elevation: 0,
      ),
    ),
  ],
);