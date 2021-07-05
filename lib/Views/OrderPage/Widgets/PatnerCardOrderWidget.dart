import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Models/PartnerModel.dart';

Widget partnerCardOrderPageWidget(PartnerModel _partner) => Container(
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
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Delivery", style: GoogleFonts.roboto(fontSize: 18, color: Colors.grey[600]),),
          Text(_partner.name, style: GoogleFonts.roboto(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),),
        ],
      ),
      IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios, color: Colors.grey[400],)),
    ],
  ),
);