import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ProductsController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';
import 'package:loja_do_real/Views/CartPage/CartPage.dart';
import '../ProductsPage/ProductsPage.dart';
import 'package:loja_do_real/Views/OrderPage/OrderPage.dart';
import 'package:loja_do_real/Views/ProfilePage/ProfilePage.dart';

class HomePageView extends StatelessWidget {
  HomePageView() {
    if (_clientController.order.id != 0)
      _screenController.homePageNavigationIndex = 1;
  }

  final ProductsController _productsController = Get.put(ProductsController());
  final ScreenController _screenController = Get.find();
  final ClientController _clientController = Get.find();

  final List<Widget> _pages = <Widget>[
    ProductsPageView(),
    orderPageView(),
    CartPageView(),
    ProfilePageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ScreenController>(
        builder: (_) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            child: _pages.elementAt(_screenController.homePageNavigationIndex),
          ),
          bottomNavigationBar: new BottomNavigationBar(
            selectedItemColor: Get.theme.primaryColor,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _clientController.order.id == 0
                      ? _screenController.homePageNavigationIndex == 0
                          ? Get.theme.primaryColor
                          : Colors.black54
                      : Colors.grey[400],
                ),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.my_library_books_rounded),
                label: "Pedidos",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: _clientController.order.id == 0
                      ? _screenController.homePageNavigationIndex == 2
                          ? Get.theme.primaryColor
                          : Colors.black54
                      : Colors.grey[400],
                ),
                label: 'Carrinho',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
            currentIndex: _screenController.homePageNavigationIndex,
            onTap: (int _index) {
              if (_clientController.order.id == 0) {
                _productsController.setActiveProductNull();
                _screenController.setHomePageNavigationIndex(_index);
              } else {
                if (_index != 0 && _index != 2) {
                  _productsController.setActiveProductNull();
                  _screenController.setHomePageNavigationIndex(_index);
                } else {
                  snackBarError(
                    "Pedido em andamento!",
                    "Você já tem um pedido na fila, espere ele ser concluido!",
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
