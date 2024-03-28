import 'package:home_water_delivery_management_system/models/bottles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class BottlesService {
  //token function
  Future <String> getToken() async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    String? user = localStorage.getString('user');
    print(user);
    if (token == null) {
      throw Exception('Token is null');
    }
    token = token.replaceAll('"', '');
    return token;
  }

  Future<List<Bottles>> getBottles() async {
    var client = http.Client();
    try {
      String token = await getToken();
      print(token);
      var response = await client.get(Uri.parse('https://khiwater.com/api/bottles'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }
      );
      if (response.statusCode == 200) {

        List<dynamic> jsonResponse = json.decode(response.body)['data'];
        List<Bottles> BottlesList =
        jsonResponse.map((json) => Bottles.fromJson(json)).toList();
        return BottlesList;
      }
      else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } finally {
      client.close();
    }
  }
Future<void> sendBottles(String size, String name) async {
    Map<String, dynamic> data = {
    'size': size,
    'name': name,
  };
    String jsonData = jsonEncode(data);

  // Define the API endpoint URL
  String apiUrl = 'https://khiwater.com/api/bottles';

  try {

    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonData,
    );


    if (response.statusCode == 200) {
      print('Data sent successfully');

    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending data: $e');
  }
}
Future<void> updateBottle(int id, String name, String size) async {
    try {

      var response = await http.put(
        Uri.parse('khiwater.com/api/bottles/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'size': size,
        }),
      );


      if (response.statusCode == 200) {
        print('Bottle updated successfully');
      } else {
        print('Failed to update bottle. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating bottle: $e');
    }
  }


  Future<void> deleteBottle(int id) async {
    try {

      var response = await http.delete(
        Uri.parse('https://khiwater.com/api/bottles/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );


      if (response.statusCode == 200) {
        print('Bottle deleted successfully');
      } else {
        print('Failed to delete bottle. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting bottle: $e');
    }
  }
}