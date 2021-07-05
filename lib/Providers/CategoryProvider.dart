import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:loja_do_real/Controllers/ClientController.dart';
import 'package:loja_do_real/Models/CategoryModel.dart';
import 'package:loja_do_real/Utils/ServerInfo.dart';
import 'package:loja_do_real/Utils/SnackBarError.dart';

final ClientController _clientController = Get.find();

class CategoryProvider{

  final String urlBase = ServerInfo.urlBase;

  Future<List<CategoryModel>> getCategories() async {
    List<CategoryModel> _categories = [];
    try {
      final response = await http.get(
        Uri.parse('$urlBase/api/categories'),
        headers: {"authorization": "Bearer ${_clientController.jwt}"},
      );
      for (var categoryData in jsonDecode(response.body)) {
        CategoryModel _category = CategoryModel.fromJson(categoryData);
        _categories.add(_category);
      }
    } catch (error) {
      snackBarError(
          "Erro ao carregar categorias",
          "Erro 0x89769",);
      return [];
    }

    return _categories;
  }
}