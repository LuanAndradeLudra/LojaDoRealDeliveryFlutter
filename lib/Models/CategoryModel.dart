class CategoryModel {
  int idCategory;
  String description = "";
  String name = "";

  CategoryModel(this.idCategory, this.name, this.description);

  static CategoryModel fromJson(json){
    return CategoryModel(json['id'], json['name'], json['description']);
  }
}