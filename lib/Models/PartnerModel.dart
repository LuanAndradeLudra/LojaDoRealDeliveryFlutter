class PartnerModel{
  int id;
  String name;
  String email;
  String phone;
  String cep;
  String city;
  String district;
  String address;
  String coordinatesA;
  String coordinatesB;
  String document;

  PartnerModel(this.id, this.name, this.email, this.phone, this.cep, this.city,
      this.district, this.address, this.coordinatesA, this.coordinatesB, this.document);

  static PartnerModel fromJson(Map<String, dynamic> json){
    return PartnerModel(json['id'], json['name'], json['email'], json['phone'], json['cep'], json['city'], json['district'], json['address'], json['coordinatesA'], json['coordinatesB'], json['document']);
  }

}