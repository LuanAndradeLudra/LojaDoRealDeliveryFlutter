import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Utils/CorporationData.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/CategoriesListWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/ProductsListLoadingWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/ProductsListWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/SearchBarFoodPageWidget.dart';
import 'package:loja_do_real/Views/ProductsPage/Widgets/CategoriesListLoadingWidget.dart';

final ProductsController _productsController = Get.find();

Widget productsListPageView() => Container(
    padding: EdgeInsets.fromLTRB(32, 0, 32, 0),
    child: SingleChildScrollView(
      physics: ScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32,),
          searchBarFoodPageWidget(),
          SizedBox(height: 16,),
          Row(children: <Widget>[
            Icon(Icons.place, color: Colors.grey[800],),
            Text(CorporationData.address, style: TextStyle(color: Colors.grey[900]),),
          ],),
          SizedBox(height: 16,),
          GetBuilder<ProductsController>(builder: (_) => _productsController.categoriesList.length == 0 ? categoriesListLoadingWidget() : categoriesListWidget(),
          ),
          SizedBox(height: 8,),
          Text("Menu", style: GoogleFonts.roboto(fontSize: 32),),
          SizedBox(height: 8,),
      GetBuilder<ProductsController>(builder: (_) => _productsController.productsList.length == 0 ? productsListLoadingWidget() : productsListWidget(),
      ),
      ],
    ),
    ),
);