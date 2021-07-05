import 'package:flutter/material.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Login/Form_Login_W.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Login/Register_Text_W.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Login/Welcome_Login_W.dart';

Widget loginPageView() => Container(
  padding: EdgeInsets.all(16),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        welcomeLoginWidget(),
        SizedBox(height: 100,),
        formLoginWidget(),
        SizedBox(height: 100,),
        registerTextWidget(),
      ],
    ),
  ),
);