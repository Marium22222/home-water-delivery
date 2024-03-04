import 'package:home_water_delivery_management_system/models/bottles_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
class BottlesService {
  Future<List<Bottles>> getBottles() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('http://167.71.238.72/api/bottles'));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of Product objects
        List<dynamic> jsonResponse = json.decode(response.body)['data'];
        List<Bottles> BottlesList =
        jsonResponse.map((json) => Bottles.fromJson(json)).toList();
        return BottlesList;
      } else {
        throw Exception('Failed to load products');
      }
    } finally {
      client.close();
    }
  }
}