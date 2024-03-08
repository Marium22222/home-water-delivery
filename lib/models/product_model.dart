

import 'dart:convert';

List<Product> productsFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String ProductToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  // int bottle_id;
  String name ;
  String description;


  Product({
    // required this.bottle_id,
    required this.description,
    required this.name,

  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    // bottle_id: json["bottle_id"],
    name: json["name"],
    description: json["description"],

  );

  Map<String, dynamic> toJson() => {
    // "bottle_id":bottle_id,
    "name": name,
    "description": description,

  };
}
