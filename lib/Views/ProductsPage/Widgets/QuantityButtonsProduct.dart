import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:vibration/vibration.dart';

final ProductsController _productsController = Get.find();
final ScreenController _screenController = Get.find();

Widget quantityButtonsFoodPageWidget() => Row(
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
                Vibration.vibrate(duration: 100);
                _productsController.setActiveProductQuantity(_productsController.activeProductQuantity - 1);
                if (_screenController.relatedListScrollController.hasClients){
                  _screenController.relatedListScrollController.jumpTo(1);
                }
              }
          ),
          SizedBox(
            width: 16,
          ),
          GetBuilder<ProductsController>(builder: (_)=>Text(
            _productsController.activeProductQuantity.toString(),
            style:
            TextStyle(color: Colors.grey, fontSize: 16),
          ),),
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
              _productsController.setActiveProductQuantity(_productsController.activeProductQuantity + 1);
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
    SizedBox(
      width: 16,
    ),
    ElevatedButton(
      onPressed: () => _productsController.addToCart(_productsController.activeProduct, _productsController.activeProductQuantity),
      child: Text("Adicionar"),
      style: ElevatedButton.styleFrom(
          primary: Get.theme.accentColor),
    ),
  ],
);