

import 'dart:convert';

List<Bottles> bottlesFromJson(String str) => List<Bottles>.from(json.decode(str).map((x) => Bottles.fromJson(x)));

String BottlesToJson(List<Bottles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bottles {
  int bottle_id;
   String size;
  String name;


  Bottles({
      required this.bottle_id,
     required this.size,
    required this.name,

  });

  factory Bottles.fromJson(Map<String, dynamic> json) => Bottles(
    bottle_id: json["bottle_id"],
     size: json["size"],
    name: json["name"],

  );

  Map<String, dynamic> toJson() => {
    "bottle_id":bottle_id,
    "size": size,
    "name": name,

  };
}
