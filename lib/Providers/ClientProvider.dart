import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

class ClientProvider{

  final String urlBase = ServerInfo.urlBase;

  Future<Map<String, dynamic>> getAddressFromCep(String _cep) async {
    var _data = {
      "next": false,
      "res": [],
    };
    try {
      var _res = await http.get(Uri.parse("https://viacep.com.br/ws/$_cep/json/"));
      if (_res.statusCode == 200){
        Map<String, dynamic> _body = jsonDecode(_res.body);
        if (_body['erro'] == null){
          _data['next'] = true;
          _data['res'] = _body;
        } else {
          snackBarError("Erro ao consultar cep", "0x4984984");
        }
      } else {
        snackBarError("Erro ao consultar cep", "0x489489");
      }
      return _data;
    } catch (error){
      snackBarError("Erro ao consultar cep", "0x63786378");
      return _data;
    }
  }

  Future<Map<String, dynamic>> registerClient(Map<String, dynamic> _client) async {
    var _data = {
      "next": false,
      "res": [],
    };
    try {
      var _res = await http.post(Uri.parse("$urlBase/api/clients/create"), body: _client);
      if (_res.statusCode == 201){
        _data['next'] = true;
        _data['res'] = jsonDecode(_res.body);
      } else {
        snackBarError("Erro ao cadastrar cliente", jsonDecode(_res.body)['error']);
      }
      return _data;
    } catch (error){
      snackBarError("Erro ao cadastrar cliente", "0x378387");
      return _data;
    }
  }

  Future<Map<String, dynamic>> loginClient(String _email, String _password) async {
    var _data = {
      "next": false,
      "res": [],
    };
    try {
      var _res = await http.post(Uri.parse("$urlBase/api/clients/auth"), body: {
        "email": _email,
        "password": _password,
      });
      if (_res.statusCode == 200){
        _data['next'] = true;
        _data['res'] = jsonDecode(_res.body);
      } else {
        snackBarError("Erro ao fazer login", jsonDecode(_res.body)['error']);
      }
      return _data;
    } catch (error){
      snackBarError("Erro ao fazer login", "0x32782");
      return _data;
    }
  }

}