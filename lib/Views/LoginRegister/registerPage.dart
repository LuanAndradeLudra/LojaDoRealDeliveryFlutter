import 'package:flutter/material.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Register/Form_Register_W.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Register/Login_Text_W.dart';
import 'package:loja_do_real/Views/LoginRegister/Widgets/Register/welcome_Register_W.dart';

Widget registerPageView1() => Container(
  padding: EdgeInsets.all(16),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        welcomeRegisterWidget(),
        SizedBox(height: 100,),
        formRegister1Widget(),
        SizedBox(height: 16,),
        loginTextWidget(),
      ],
    ),
  ),
);

Widget registerPageView2() => Container(
  padding: EdgeInsets.all(16),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        welcomeRegisterWidget(),
        SizedBox(height: 100,),
        formRegister2Widget(),
        SizedBox(height: 16,),
        loginTextWidget(),
      ],
    ),
  ),
);

Widget registerPageView3() => Container(
  padding: EdgeInsets.all(16),
  child: SingleChildScrollView(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        welcomeRegisterWidget(),
        SizedBox(height: 100,),
        formRegister3Widget(),
        SizedBox(height: 16,),
        loginTextWidget(),
      ],
    ),
  ),
);
