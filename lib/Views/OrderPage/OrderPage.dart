import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Views/OrderPage/Widgets/MainInfoOrderWidget.dart';
import 'package:loja_do_real/Views/OrderPage/Widgets/NoneOrderWidget.dart';
import 'package:loja_do_real/Views/OrderPage/Widgets/ProductCartOrderWidget.dart';
import 'Widgets/PatnerCardOrderWidget.dart';

final ClientController _clientController = Get.find();


Widget orderPageView() => GetBuilder<ProductsController>(builder: (_) => Container(
  child: _clientController.order.id == 0 ? noneOrderPageWidget() : SingleChildScrollView(
    physics: ScrollPhysics(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainInfoOrderPageWidget(_clientController.order),
        partnerCardOrderPageWidget(_clientController.order.partner),
        SizedBox(height: 12,),
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Text("Produtos", style: GoogleFonts.roboto(color: Colors.grey[600], fontSize: 17),),
          padding: EdgeInsets.all(16),),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: _clientController.order.products.length,
            itemBuilder: (_, _index) {
              return productCardOrderPageWidget(_clientController.order.products.elementAt(_index));
            }),
      ],
    ),
  ),
),);
