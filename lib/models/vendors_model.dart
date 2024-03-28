import 'dart:convert';
List<Vendors> vendorsFromJson(String str) => List<Vendors>.from(json.decode(str).map((x) => Vendors.fromJson(x)));
String VendorsToJson(List<Vendors> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Vendors {

  String name ;
  String phone_1;
  String phone_2;
  String address;
  String city;
  Vendors({

    required this.name,
    required this.phone_1,
    required this.phone_2,
    required this.address,
    required this.city,

  });
  factory Vendors.fromJson(Map<String, dynamic> json) => Vendors(

    name: json["name"],
    phone_1: json["phone_1"],
    phone_2: json["phone_2"],
    address: json["address"],
    city: json["city"],
  );
  Map<String, dynamic> toJson() => {

    "name": name,
    "phone_1": phone_1,
    "phone_2": phone_2,
    "address": address,
    "city":city,
  };
}










