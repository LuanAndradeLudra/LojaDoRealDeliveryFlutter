import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';

Widget productCardOrderPageWidget(ProductCartModel _productCart) => Container(
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
    children: [
      Container(
        height: 80,
        width: 80,
        margin: EdgeInsets.only(right: 6, bottom: 6),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        child: CachedNetworkImage(
          imageUrl: ServerInfo.urlImgProducts + _productCart.product.imgUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Get.theme.accentColor.withOpacity(0.7),
                ),
              ),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${_productCart.product.name}",
              style: GoogleFonts.roboto(
                  fontSize: 17, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              "Total: R\$ ${_productCart.total.toStringAsFixed(2)} (Qtd: ${_productCart.quantity}x)",
              style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ],
  ),
);