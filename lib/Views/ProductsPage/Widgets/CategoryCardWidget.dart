import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Models/CategoryModel.dart';
import 'package:vibration/vibration.dart';

final ProductsController _productsController = Get.find();

Widget categoryCardWidget(CategoryModel _category) => new Column(

  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    GestureDetector(
      child: Container(
          height: 80,
          padding: EdgeInsetsDirectional.all(32),
          decoration: new BoxDecoration(
            color:  _productsController.categorySelected == _category.idCategory ? Get.theme.primaryColor.withOpacity(0.8) : Colors.grey[300],
            borderRadius: new BorderRadius.all(const  Radius.circular(20.0),),
          ),
          child: Text(_category.name, style: GoogleFonts.roboto(textStyle: TextStyle(color: _productsController.categorySelected == _category.idCategory ? Colors.white : Colors.black),),),
        ),
      onTap: (){
        Vibration.vibrate(duration: 100);
        _productsController.setCategorySelected(_category.idCategory);
      },
    ),
  ],
);
