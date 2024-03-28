import 'dart:convert';
List<Product> productsFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));
String ProductToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class Product {
  int product_id;
  String name ;
  int vendor_id;
  int bottle_id;
  String description;
  int price;
  String image_url;
  Product({
    // required this.bottle_id,
    required this.product_id,
    required this.name,
    required this.vendor_id,
    required this.bottle_id,
    required this.description,
    required this.price,
    required this.image_url,
    // required this.description,
    // required this.name,
  });
  factory Product.fromJson(Map<String, dynamic> json) => Product(
    // bottle_id: json["bottle_id"],
    product_id: json["product_id"],
    name: json["name"],
    vendor_id: json["vendor_id"],
    bottle_id: json["bottle_id"],
    description: json["description"],
    price: json["price"],
    image_url: json["image_url"],
  );
  Map<String, dynamic> toJson() => {
    // "bottle_id":bottle_id,
    "product_id": product_id,
    "name": name,
    "vendor_id": vendor_id,
    "bottle_id": bottle_id,
    "description": description,
    "price": price,
    "image_url": image_url,
  };
}










