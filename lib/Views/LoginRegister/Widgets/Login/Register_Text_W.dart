import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';

final ScreenController _screenController = Get.find();

Widget registerTextWidget() => Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      "Não tem uma conta? ",
      style: GoogleFonts.roboto(fontSize: 16, color: Colors.grey[600]),
    ),
    GestureDetector(
      child: Text(
        "Registre-se",
        style: GoogleFonts.roboto(fontSize: 17, color: Get.theme.primaryColor),
      ),
      onTap: () => _screenController.setTabControllerLoginRegister(1),
    ),
  ],
);