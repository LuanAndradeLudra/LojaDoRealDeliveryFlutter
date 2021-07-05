import 'dart:convert';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Models/CategoryModel.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';
import 'package:loja_do_real/Models/ProductModel.dart';
import 'package:loja_do_real/Providers/CategoryProvider.dart';
import 'package:loja_do_real/Providers/OrderProvider.dart';
import 'package:loja_do_real/Providers/ProductProvider.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

class ProductsController extends GetxController{

  final ScreenController _screenController = Get.find();
  final ClientController _clientController = Get.find();

  final CategoryProvider _categoryProvider = new CategoryProvider();
  final ProductProvider _productProvider = new ProductProvider();
  final OrderProvider _orderProvider = new OrderProvider();

  int categorySelected = 0;
  List<CategoryModel> categoriesList = [];

  List<ProductModel> productsList = [];
  List<ProductModel> productsListActive = [];
  ProductModel activeProduct = ProductModel(0, "", "", 0, 0, "", 0);
  int activeProductQuantity = 1;

  List<ProductCartModel> productsInCart = [];
  int quantityProductsInCart = 0;
  double cartPrice = 0;

  ProductsController(){
    getData();
  }

  void getData() async {
    productsList = await _productProvider.getProducts();
    categoriesList = await _categoryProvider.getCategories();
    setCategorySelected(categoriesList.elementAt(0).idCategory);
    update();
  }


  void setCategorySelected(int categoryId){
    categorySelected = categoryId;
    productsListActive = [];
    for (ProductModel product in productsList) {
      if (product.categoryId == categoryId){
        productsListActive.add(product);
      }
    }
    update();
  }

  void setActiveProduct(ProductModel _product) {
    setActiveProductQuantity(1);
    this.activeProduct = _product;
    update();
  }

  void setActiveProductNull(){
    this.activeProduct = new ProductModel(0, "", "", 0, 0, "", 0);
    setActiveProductQuantity(1);
    update();
  }

  void setActiveProductQuantity(int quantity){
    if (quantity > 0){
      activeProductQuantity = quantity;
    }
    update();
  }

  void addToCart(ProductModel _product, int _quantity) {
    bool exist = false;
    productsInCart.forEach((product) {
      if (product.product.name == _product.name) {
        exist = true;
        product.quantity += _quantity;
        product.total = product.quantity * product.product.price;
        double princeToIncrease = product.product.price * _quantity;
        setCartPrice(cartPrice + princeToIncrease);
      }
    });
    if (!exist) {
      double _total = _product.price * _quantity;
      productsInCart.add(ProductCartModel(_product, _quantity, _total));
      cartPrice += _total;
    }
    setQuantityProductsInCart(quantityProductsInCart + _quantity);
    snackBarError(
        "Produto adicionado!",
        "${_quantity}x ${_product.name} foi adicionado ao carrinho!",);
  }

  void removeToCart(ProductCartModel _product){
    setQuantityProductsInCart(quantityProductsInCart - _product.quantity);
    productsInCart.removeWhere((element) => element.product.id == _product.product.id);
    double priceToRemove = _product.product.price * _product.quantity;
    cartPrice -= priceToRemove;
    cartPrice = cartPrice < 0 ? 0 : cartPrice;
    snackBarError(
        "Produto removido!",
        "${_product.quantity}x ${_product.product.name} foi removido do carrinho",);
    update();
  }

  void setCartPrice(double _total) {
    cartPrice = _total;
    update();
  }

  void setQuantityProductsInCart(int value) {
    quantityProductsInCart = value;
    update();
  }

  void createOrder(int _id) async {
    if (cartPrice > 20){
      List _listProducts = [];
      productsInCart.forEach((_product) {
        _listProducts.add(_product.toJson());
      });
      String _products = jsonEncode(_listProducts);

      var order = await _orderProvider.createOrder(_id, 1,
          _products, cartPrice, 0);

      if (order['next']) {
        await _clientController.existsOrderOpened();
        _screenController.setHomePageNavigationIndex(1);
        cartPrice = 0;
        quantityProductsInCart = 0;
        productsInCart = [];
      }
    } else {
      snackBarError("Ooops!", "Você precisa ter pelo menos 20 reais em produtos!");
    }
  }

}