import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';

final ScreenController _screenController = Get.find();

Widget noneOrderPageWidget() => Center(child: Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        "Nenhum pedido ativo!",
        style: GoogleFonts.roboto(
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        textAlign: TextAlign.center,
      ),
      SizedBox(
        height: 16,
      ),
      ElevatedButton(
        onPressed: () => _screenController.setHomePageNavigationIndex(0),
        child: Text("Voltar ao inicio"),
        style: ElevatedButton.styleFrom(
            primary: Get.theme.accentColor,
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            textStyle:
            TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ),
    ],
  ),
),);
