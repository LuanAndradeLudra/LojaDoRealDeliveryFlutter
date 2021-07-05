import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';

final ProductsController _productsController = Get.find();

Widget bannerProductWidget() => Container(
  height: 300,
  child: CachedNetworkImage(
    imageUrl: ServerInfo.urlImgProducts + _productsController.activeProduct.imgUrl,
    placeholder: (context, url) => CircularProgressIndicator(),
    errorWidget: (context, url, error) => Icon(Icons.error),
    fit: BoxFit.cover,
    width: Get.width,
    alignment: Alignment.center,
  ),
);