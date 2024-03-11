import 'package:home_water_delivery_management_system/models/bottles_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class BottlesService {
  Future <String> getToken() async {
  final SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');

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
    var response = await client.get(
      Uri.parse('http://167.71.238.72/api/bottles'),
      headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    });

    if (response.statusCode == 200) {
      // Parse the JSON response into a list of Bottles objects
      List<dynamic> jsonResponse = json.decode(response.body)['data'];
      List<Bottles> bottlesList = jsonResponse.map((json) => Bottles.fromJson(json)).toList();
      return bottlesList;
    } else {
      throw Exception('Failed to load bottles: ${response.statusCode}');
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
    String token = await getToken();

  // Define the API endpoint URL
  String apiUrl = 'http://167.71.238.72/api/bottles';

  try {
    // Make a POST request to the API endpoint
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: jsonData,
    );

    // Check if the request was successful (status code 200)
    if (response.statusCode == 201) {
      print('Data sent successfully');
      // Optionally, you can process the response from the API here
    } else {
      print('Failed to send data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error sending data: $e');
  }
}
Future<void> updateBottle(int id, String name, String size) async {
    try {
      // Send a PUT request to update a bottle
      String token = await getToken();

      var response = await http.put(
        Uri.parse('http://167.71.238.72/api/bottles/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'size': size,
        }),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('Bottle updated successfully');
      } else {
        print('Failed to update bottle. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating bottle: $e');
    }
  }

  // Function to delete a bottle
  Future<void> deleteBottle(int id) async {
    try {
      String token = await getToken();
      // Send a DELETE request to delete a bottle
      var response = await http.delete(
        Uri.parse('http://167.71.238.72/api/bottles/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      // Check if the request was successful (status code 200)
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