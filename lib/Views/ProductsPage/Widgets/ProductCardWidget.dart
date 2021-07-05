import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Models/ProductModel.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:vibration/vibration.dart';

final ProductsController _productsController = Get.find();

Widget productCardWidget(ProductModel _product) => GestureDetector(
  child: Row(
    children: [
      Container(
        height: 130,
        width: 130,
        margin: EdgeInsets.only(right: 6, bottom: 6),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(
            const Radius.circular(20.0),
          ),
        ),
        child:
        CachedNetworkImage(
          imageUrl: ServerInfo.urlImgProducts + _product.imgUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress, color: Get.theme.accentColor.withOpacity(0.7),),),
          errorWidget: (context, url, error) => Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _product.name,
              style: GoogleFonts.roboto(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 4,
            ),
            Text(_product.description.length > 15 ? "${_product.description.substring(0, 15)}..." : _product.description),
            SizedBox(
              height: 4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("R\$ ${_product.price}", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w500),),
                MaterialButton(
                  height: 28,
                  shape: CircleBorder(),
                  color: Get.theme.primaryColor,
                  onPressed: () {
                    Vibration.vibrate(duration: 100);
                    _productsController.addToCart(_product, 1);
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ],
  ),
  onTap: (){
    _productsController.setActiveProduct(_product);
  },
);
