import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';

final ClientController _clientController = Get.find();

Widget cardProfileWidget() => Container(
  height: 400,
  width: Get.width,
  color: Get.theme.primaryColor,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        height: 32,
      ),
      CircleAvatar(
          radius: 60,
          backgroundColor: Colors.white,
          backgroundImage: CachedNetworkImageProvider(
            ServerInfo.urlImgClients + _clientController.client.imgUrl,
          )),
      Text(
        _clientController.client.name,
        style: GoogleFonts.roboto(
            fontSize: 22,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1),
      ),
      Text(
        _clientController.client.email,
        style: GoogleFonts.roboto(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: 1),
      ),
      SizedBox(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text(
                "Vendas ativas",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                "0",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                "Vendas finalizadas",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                "0",
                style: GoogleFonts.roboto(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      )
    ],
  ),
);
