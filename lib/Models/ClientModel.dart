class ClientModel {
  int id;
  String name;
  String email;
  String phone;
  String cep;
  String city;
  String district;
  String address;
  String number;
  String coordinatesA;
  String coordinatesB;
  String imgUrl;

  ClientModel(
      this.id,
      this.name,
      this.email,
      this.phone,
      this.cep,
      this.city,
      this.district,
      this.address,
      this.number,
      this.coordinatesA,
      this.coordinatesB,
      this.imgUrl);

  static fromJson(json) {
    return ClientModel(
        json['id'],
        json['name'],
        json['email'],
        json['phone'],
        json['cep'],
        json['city'],
        json['district'],
        json['address'],
        json['number'],
        json['coordinatesA'],
        json['coordinatesB'],
        json['imgUrl']);
  }
}
