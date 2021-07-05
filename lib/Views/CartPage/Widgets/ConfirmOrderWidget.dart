import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';

final ProductsController _productsController = Get.find();
final ClientController _clientController = Get.find();

Widget confirmOrderWidget() => Container(
  color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: (){
              Get.close(1);
              _productsController.createOrder(_clientController.client.id);
            },
            style: ElevatedButton.styleFrom(
              primary: Get.theme.accentColor,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Text("Finalizar a compra"),
              Icon(Icons.arrow_forward_ios, color: Colors.white,),
              Icon(Icons.arrow_forward_ios, color: Colors.white,),
            ],),
          ),
          SizedBox(height: 12,),
          ElevatedButton(
            onPressed: (){
              Get.close(1);
            },
            style: ElevatedButton.styleFrom(
              primary: Get.theme.primaryColor,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.arrow_back_ios, color: Colors.white,),
                Icon(Icons.arrow_back_ios, color: Colors.white,),
                Text("Cancelar"),
              ],),
          ),
        ],
      ),
    );
