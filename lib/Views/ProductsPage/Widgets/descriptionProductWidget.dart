import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Utils/CorporationData.dart';

final ProductsController _productsController = Get.find();

Widget descriptionProductWidget() => Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(
      "${_productsController.activeProduct.name}",
      style: GoogleFonts.roboto(
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.grey[900],
          letterSpacing: 0),
    ),
    SizedBox(height: 8,),
    Text(
      "R\$ ${_productsController.activeProduct.price}",
      style: TextStyle(
          color: Colors.red, fontSize: 22, fontWeight: FontWeight.w500),
    ),
    SizedBox(
      height: 12,
    ),
    Text(
      _productsController.activeProduct.description,
      style: GoogleFonts.roboto(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.grey[700]),
    ),
    SizedBox(
      height: 12,
    ),
    Row(
      children: [
        Icon(
          Icons.place,
          color: Colors.grey[400],
        ),
        Text(
          CorporationData.address,
          style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400]),
        ),
      ],
    ),
    Row(
      children: [
        Icon(
          Icons.timelapse,
          color: Colors.grey[400],
        ),
        Text(
          CorporationData.timeFunc,
          style: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.grey[400]),
        ),
      ],
    ),
    SizedBox(
      height: 8,
    ),
  ],
);
