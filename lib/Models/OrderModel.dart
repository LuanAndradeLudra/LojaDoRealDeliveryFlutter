
import 'package:loja_do_real/Models/PartnerModel.dart';
import 'package:loja_do_real/Models/ProductCartModel.dart';

class OrderModel {
  int id;
  int clientId;
  PartnerModel partner;
  List<ProductCartModel> products;
  double value;
  int stage;
  String createdAt;

  OrderModel(this.id, this.clientId, this.partner, this.products, this.value, this.stage,
      this.createdAt);

  int getTotalQuantity(){
    int total = 0;
    products.forEach((product) {
      total += product.quantity;
    });
    return total;
  }

  String getStatus() {
    String status = "";
    switch (stage) {
      case 0:
        status = "Aguardando";
        break;
      case 1:
        status = "Aceito";
        break;
      case 2:
        status = "Em entrega";
        break;
      case 3:
        status = "Finalizado";
        break;
    }
    return status;
  }
}
