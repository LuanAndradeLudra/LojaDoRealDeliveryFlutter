import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'dart:convert';
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

final ClientController _clientController = Get.find();

class OrderProvider{

  final String urlBase = ServerInfo.urlBase;

  Future<Map<String, dynamic>> createOrder(int _userId, int _partnerId, String _products, double _value, int _stage) async {
    var _data = {
      "next": false,
      "res": [],
    };
    try {
      var data = {
        'clientId': _userId.toString(),
        'partnerId': _partnerId.toString(),
        'products' : _products,
        'value': _value.toString(),
        'stage': _stage.toString()
      };

      var _res = await http.post(Uri.parse("$urlBase/api/orders/create"), body: data, headers: {"authorization": "Bearer ${_clientController.jwt}"},);
      if (_res.statusCode == 201){
        _data['next'] = true;
        _data['res'] = jsonDecode(_res.body);
      } else {
        snackBarError("Erro ao realizar pedido", jsonDecode(_res.body)['error']);
      }
      return _data;
    } catch (error){
      snackBarError("Erro ao realizar pedido", "0x378387");
      return _data;
    }
  }

  Future existsOrderOpened(int _id) async {
    var _data = {
      'next': false,
      'data' : {},
    };
    try {
      final _response = await http.get(Uri.parse('$urlBase/api/orderopened/$_id'), headers: {"authorization": "Bearer ${_clientController.jwt}"},);
      if (_response.statusCode == 200) {
        _data['next'] = true;
        _data['data'] = _response.body;
      }

      return _data;

    } catch (error) {
      snackBarError(
          "Erro ao realizar pedido (INTERNAL)",
          "Erro 0x8654",);
      return _data;
    }
  }

  Future confirmOrder(Map<String, dynamic> _order) async {
    var _data = {
      "next": false,
      "res": [],
    };
    try {
      var _res = await http.post(Uri.parse("$urlBase/api/orders/update"), body: _order, headers: {"authorization": "Bearer ${_clientController.jwt}"},);
      if (_res.statusCode == 200){
        _data['next'] = true;
        _data['res'] = jsonDecode(_res.body);
      } else {
        snackBarError("Erro ao finalizar pedido", jsonDecode(_res.body)['error']);
      }
      return _data;
    } catch (error){
      snackBarError("Erro ao finalizar pedido", "0x37687687");
      return _data;
    }
  }


}