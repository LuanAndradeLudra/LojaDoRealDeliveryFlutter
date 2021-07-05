import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:loja_do_real/Views/CartPage/Widgets/QuantityButtonsCartPageWidget.dart';
import 'package:vibration/vibration.dart';

final ProductsController _productsController = Get.find();
final ScreenController _screenController = Get.find();

Widget productCardCartPageWidget(ProductCartModel _product) => Padding(
  padding: EdgeInsets.symmetric(vertical: 16),
  child: GestureDetector(
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
          child: CachedNetworkImage(
            imageUrl: ServerInfo.urlImgProducts + _product.product.imgUrl,
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
                _product.product.name,
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 4,
              ),
              Text(_product.product.description.length > 15
                  ? "${_product.product.description.substring(0, 15)}..."
                  : _product.product.description),
              SizedBox(
                height: 4,
              ),
              Text(
                "Unidade R\$ ${_product.product.price.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "Total R\$ ${_product.total.toStringAsFixed(2)}",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  quantityButtonsCartPageWidget(_product),
                  Container(
                    color: Get.theme.accentColor,
                    child: new IconButton(
                      icon: new Icon(
                        Icons.cancel,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _productsController.removeToCart(_product);
                        Vibration.vibrate(duration: 100);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
    onTap: () {
      _productsController.activeProduct = _product.product;
      _screenController.setHomePageNavigationIndex(0);
    },
  ),
);
