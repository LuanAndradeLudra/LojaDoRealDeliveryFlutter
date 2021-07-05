import 'package:get/get.dart';
import 'package:loja_do_real/Views/HomePage/HomePage.dart';
import 'package:loja_do_real/Views/LoginRegister/LoginRegister.dart';
import 'package:loja_do_real/Views/SplashScreen/SplashScreen.dart';

class Routes{
  static final List<GetPage> routes = [
    GetPage(name: ROUTE_SPLASH_SCREEN, page: () => SplashScreenView()),
    GetPage(name: ROUTE_LOGIN_REGISTER, page: () => LoginRegisterView()),
    GetPage(name: ROUTE_HOME_PAGE, page: () => HomePageView()),
  ];

  static const ROUTE_SPLASH_SCREEN = "/splashscreen";
  static const ROUTE_LOGIN_REGISTER = "/loginregister";
  static const ROUTE_HOME_PAGE = "/homepage";
}