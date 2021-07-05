import 'package:loja_do_real/Models/ProductModel.dart';

class ProductCartModel {
  ProductModel product;
  int quantity;
  double total;

  ProductCartModel(this.product, this.quantity, this.total);

  Map<String, dynamic> toJson(){
    return {
      "product" : product.toJson(),
      "quantity" : quantity,
      "total" : total
    };
  }

}