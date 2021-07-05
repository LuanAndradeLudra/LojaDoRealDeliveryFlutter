import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Routes/Routes.dart';
import 'package:loja_do_real/Utils/ColorsPalette.dart';

void main() => runApp(new GetMaterialApp(
  debugShowCheckedModeBanner: false,
  getPages: Routes.routes,
  initialRoute: Routes.ROUTE_SPLASH_SCREEN,
  theme: ThemeData(
    primaryColor: ColorsPalette.mainColor1,
    accentColor: ColorsPalette.mainColor2,
  ),
));