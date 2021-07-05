import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Views/LoginRegister/loginPage.dart';
import 'package:loja_do_real/Views/LoginRegister/registerPage.dart';

class LoginRegisterView extends StatefulWidget {
  @override
  _LoginRegisterViewState createState() => _LoginRegisterViewState();
}

class _LoginRegisterViewState extends State<LoginRegisterView> with SingleTickerProviderStateMixin {

  final ScreenController _screenController = Get.put(ScreenController());

  final List<Widget> _pages = <Widget>[
    Tab(child: loginPageView(),),
    Tab(child: registerPageView1()),
    Tab(child: registerPageView2()),
    Tab(child: registerPageView3()),
  ];

  @override
  void initState() {
    Get.put(ClientController());
    _screenController.tabControllerLoginRegister = TabController(length: _pages.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _screenController.tabControllerLoginRegister.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _screenController.tabControllerLoginRegister,
        children: _pages,
      ),
    );
  }
}

