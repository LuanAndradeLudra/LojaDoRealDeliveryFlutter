import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Models/ProductModel.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

final ClientController _clientController = Get.find();

class ProductProvider{

  final String urlBase = ServerInfo.urlBase;

  Future<List<ProductModel>> getProducts() async {
    List<ProductModel> _products = [];
    try {
      final response = await http.get(
        Uri.parse('$urlBase/api/products'),
        headers: {"authorization": "Bearer ${_clientController.jwt}"},
      );
      for (var _productData in jsonDecode(response.body)) {
        _productData['price'] = _productData['price'].toDouble();
        ProductModel _product = ProductModel.fromJson(_productData);
        _products.add(_product);
      }
    } catch (error) {
      snackBarError(
        "Erro ao carregar produtos",
        "Erro 0x89769",);
      return [];
    }

    return _products;
  }
}