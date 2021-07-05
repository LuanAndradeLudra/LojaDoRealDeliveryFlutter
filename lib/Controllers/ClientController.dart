import 'dart:convert';
import 'package:get/get.dart';
import 'package:loja_do_real/Controllers/ScreenController.dart';
import 'package:loja_do_real/Models/ClientModel.dart';
import 'package:loja_do_real/Models/OrderModel.dart';
import 'package:loja_do_real/Models/PartnerModel.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';
import 'package:loja_do_real/Models/ProductModel.dart';
import 'package:loja_do_real/Providers/ClientProvider.dart';
import 'package:loja_do_real/Providers/OrderProvider.dart';
import 'package:loja_do_real/Routes/Routes.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

class ClientController extends GetxController{

  final ScreenController _screenController = Get.find();

  final ClientProvider _clientProvider = new ClientProvider();

  late ClientModel client;

  OrderModel order = new OrderModel(
      0, 0, PartnerModel(0,  "", "", "", "", "", "", "", "", "", ""), [], 0, 0, "");

  late String jwt;

  final OrderProvider _orderProvider = new OrderProvider();

  Future<Map<String, dynamic>> getAddressFromCep(String _cep) async {
    Map<String, dynamic> _data = await _clientProvider.getAddressFromCep(_cep);

    if (!_data['next']){
      snackBarError("Erro ao consultar cep", "0x00001");
    }
    return _data;
  }

  void register(Map<String, dynamic> _client) async {

    _client['coordinatesA'] = '0';
    _client['coordinatesB'] = '0';

    Map<String, dynamic> _data = await _clientProvider.registerClient(_client);

    if (_data['next']){
      login(_client['email'], _client['password']);
      _screenController.setLoadingRegister(false);
    } else {
      _screenController.setLoadingRegister(false);
    }

    _screenController.setLoadingRegister(false);
  }

  void login(String _email, String _password) async {

    _screenController.setLoadingLogin(true);

    Map<String, dynamic> _data = await _clientProvider.loginClient(_email, _password);

    if (_data['next']){
      client = ClientModel.fromJson(_data['res']['client']);
      jwt = _data['res']['token'];
      await existsOrderOpened();
      _screenController.setLoadingLogin(false);
      Get.toNamed(Routes.ROUTE_HOME_PAGE);
    } else {
      _screenController.setLoadingLogin(false);
    }

    _screenController.setLoadingLogin(false);
  }

  existsOrderOpened() async {
    Map<String, dynamic> orderOpened = await _orderProvider.existsOrderOpened(client.id);
    if (orderOpened['next']){
      Map<String, dynamic> data = jsonDecode(orderOpened['data']);
      if (data['stage'] != 4){
        List<ProductCartModel> _products = [];
        ProductModel _product;
        ProductCartModel _productCart;
        data['products'].forEach((p) {
          p['product']['price'] = p['product']['price'].toDouble();
          p['total'] = p['total'].toDouble();
          _product = ProductModel.fromJson(p['product']);
          _productCart =
          new ProductCartModel(_product, p['quantity'], p['total']);
          _products.add(_productCart);
        });
        PartnerModel _partner = new PartnerModel(
            data['partner']['id'],
            data['partner']['name'],
            data['partner']['email'],
            data['partner']['phone'],
            data['partner']['cep'],
            data['partner']['city'],
            data['partner']['district'],
            data['partner']['address'],
            data['partner']['coordinatesA'],
            data['partner']['coordinatesB'],
            data['partner']['document']);
        OrderModel _orderModel = new OrderModel(data['id'], data['clientId'], _partner, _products,
            data['value'], data['stage'], data['createdAt']);
        order = _orderModel;
      }

      return null;
    } else {
      order = new OrderModel(
          0, 0, PartnerModel(0,  "", "", "", "", "", "", "", "", "", ""), [], 0, 0, "");
      _screenController.setHomePageNavigationIndex(0);
    }
  }

  updateOrderToConfirm(int _stage) async {

    Map<String, dynamic> _order = {
      "id": order.id.toString(),
      "clientId": order.clientId.toString(),
      "products": jsonEncode(order.products),
      "value": order.value.toString(),
      "partnerId": order.partner.id.toString(),
      "stage": _stage.toString(),
    };

    _orderProvider.confirmOrder(_order);
    order = new OrderModel(
        0, 0, PartnerModel(0, "", "", "", "", "", "", "", "", "", ""), [], 0, 0, "");
    _screenController.setHomePageNavigationIndex(0);
  }

}