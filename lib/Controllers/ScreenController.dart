import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenController extends GetxController{

  bool loadingLogin = false;
  bool loadingRegister = false;

  late final TabController tabControllerLoginRegister;

  int homePageNavigationIndex = 0;

  final ScrollController relatedListScrollController = ScrollController();

  setTabControllerLoginRegister(int value){
    tabControllerLoginRegister.index = value;
    update();
  }

  setLoadingLogin(bool value){
    loadingLogin = value;
    update();
  }

  setLoadingRegister(bool value){
    loadingRegister = value;
    update();
  }

  setHomePageNavigationIndex(int value){
    homePageNavigationIndex = value;
    update();
  }

}