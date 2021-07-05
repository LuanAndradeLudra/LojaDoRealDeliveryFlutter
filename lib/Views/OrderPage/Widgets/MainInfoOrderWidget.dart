import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Models/OrderModel.dart';

final ClientController _clientController = Get.find();
final ProductsController _productsController = Get.find();

Widget mainInfoOrderPageWidget(OrderModel _order) =>
    Container(
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
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.timer,
            size: 70,
            color: Get.theme.accentColor,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total: R\$ ${_order.value}",
                style: GoogleFonts.roboto(
                    fontSize: 20, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                "(${_order.getTotalQuantity()} items)",
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 4,
              ),
              GetBuilder<ProductsController>(builder: (_) =>
                  Text(
                    "Status - ${_order.getStatus()}",
                    style:
                    GoogleFonts.roboto(fontSize: 16, color: Colors.grey[500]),
                  ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(_order.createdAt),
              _order.getStatus() != "Finalizado" ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Get.theme.primaryColor,
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16,),
                      textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  onPressed: () async {
               await _clientController.existsOrderOpened();
                _productsController.update();
              }, child: Text("Atualizar")) : Container(),
              _order.getStatus() == "Finalizado" ? ElevatedButton(onPressed: () async {
                await _clientController.updateOrderToConfirm(4);
                _productsController.update();
              }, child: Text("Confirmar")) : Container(),
            ],
          ),
        ],
      ),
    );
