import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Utils/ShadowContainer.dart';

final ClientController _clientController = Get.find();
final ScreenController _screenController = Get.find();

Widget registerConfirm(Map<String, dynamic> _client) => Container(
  width: Get.width,
  padding: EdgeInsets.all(16),
  color: Colors.white,
  child: Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      shadowContainer(Text("Esses dados estão corretos?", style: GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w600),),),
      shadowContainer(Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Nome: ${_client['name']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Email: ${_client['email']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Telefone: ${_client['phone']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Cep: ${_client['cep']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Endereço: ${_client['address']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Número da residência: ${_client['number']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Bairro: ${_client['district']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
          Text("Cidade: ${_client['city']}", style: GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),),
        ],
      )),
      ElevatedButton(onPressed: (){
        Get.close(1);
        _screenController.setLoadingRegister(true);
        _clientController.register(_client);
      }, style: ElevatedButton.styleFrom(primary: Get.theme.primaryColor),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 20), child: Text("Confirmar!"),),),
    ],
  ),
);