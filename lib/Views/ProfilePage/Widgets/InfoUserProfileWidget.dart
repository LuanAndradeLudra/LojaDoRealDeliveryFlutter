import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';

final ClientController _clientController = Get.find();

Widget infoUserProfileWidget() => Container(
  margin: EdgeInsets.symmetric(vertical: 8),
  width: Get.width,
  padding: EdgeInsets.all(16),
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
  child:Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Suas informações de contato!", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w500),),
          SizedBox(height: 12,),
          Text("Telefone: ${_clientController.client.phone}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),),
          Text("Endereço: ${_clientController.client.address}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),),
          Text("Cep: ${_clientController.client.cep}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),),
          Text("Cidade: ${_clientController.client.city}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),),
          Text("Bairro: ${_clientController.client.district}", style: GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400),),
        ],
      ),
      SizedBox(height: 12,),
    ],
  ),
);