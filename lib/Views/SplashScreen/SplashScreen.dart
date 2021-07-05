import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Views/LoginRegister/LoginRegister.dart';

class SplashScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
        duration: 3000,
        splash: 'assets/images/icon.png',
        nextScreen: LoginRegisterView(),
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Get.theme.accentColor,
        splashIconSize: 500,
    );
  }
}
