import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget welcomeLoginWidget() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    SizedBox(
      height: 80,
    ),
    Text(
      "Bem vindo,",
      style: GoogleFonts.roboto(
        fontSize: 40,
        fontWeight: FontWeight.w800,
      ),
    ),
    SizedBox(
      height: 8,
    ),
    Text(
      "Faça login para continuar!",
      style: GoogleFonts.roboto(
        fontSize: 20,
        color: Colors.grey[500],
        letterSpacing: 1,
      ),
    ),
  ],
);