// To parse this JSON data, do
//
//     final bottles = bottlesFromJson(jsonString);

import 'dart:convert';

Bottles bottlesFromJson(String str) => Bottles.fromJson(json.decode(str));

String bottlesToJson(Bottles data) => json.encode(data.toJson());

class Bottles {
  List<Datum> data;

  Bottles({
    required this.data,
  });

  factory Bottles.fromJson(Map<String, dynamic> json) => Bottles(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  String name;
  String size;

  Datum({
    required this.name,
    required this.size,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    name: json["name"],
    size: json["size"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "size": size,
  };
}
