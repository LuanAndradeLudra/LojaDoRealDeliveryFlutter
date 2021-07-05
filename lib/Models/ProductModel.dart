class ProductModel{
  int id;
  String name;
  String description;
  double price;
  int amount;
  String imgUrl;
  int categoryId;

  ProductModel(this.id, this.name, this.description, this.price, this.amount, this.imgUrl, this.categoryId);

  static ProductModel fromJson(json){
    ProductModel _product = new ProductModel(json['id'], json['name'], json['description'], json['price'], json['amount'], json['imgUrl'], json['categoryId']);
    return _product;
  }

  Map<String, dynamic> toJson(){
    return {
      "id" : id,
      "name" : name,
      "description" : description,
      "price" : price,
      "amount" : amount,
      "imgUrl" : imgUrl,
      "categoryId" : categoryId,
    };
  }

}