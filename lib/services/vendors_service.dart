import 'package:home_water_delivery_management_system/models/vendors_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class VendorsService {
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
  Future<Vendors> getVendors(int id) async {
    var client = http.Client();
    try {
      String token = await getToken();
      print(token);

      var response = await client.get(
        Uri.parse('https://khiwater.com/api/vendors/$id'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        dynamic jsonResponse = json.decode(response.body)['data'];
        Vendors vendor = Vendors.fromJson(jsonResponse);
        print('Response body: ${response.body}');
        print('Parsed JSON response: $jsonResponse');
        return vendor;
      } else {
        throw Exception('Failed to load vendor');
      }
    } finally {
      client.close();
    }
  }


  Future<void> sendVendors(String name, String phone_1,String phone_2,String address,String city_id) async {
    Map<String, dynamic> data = {
      'name': name,
      'phone_1': phone_1,
      'phone_2':phone_2,
      'address': address,
      'city_id' :city_id,


    };
    String jsonData = jsonEncode(data);
    print(data);
    String token = await getToken();
    String apiUrl = 'https://khiwater.com/api/vendors';

    try {

      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
        body: jsonData,
      );


      if (response.statusCode == 201) {
        print('Data sent successfully');
        // print(response);

        var body = response.body;
        print(body);
        // Optionally, you can process the response from the API here
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }
  Future<void> updateVendors(int id, String name, String phone_1,String phone_2,String address,String city_id ) async {
    try {
      Map<String, dynamic> data = {
        'name': name,
        'phone_1': phone_1,
        'phone_2':phone_2,
        'address': address,
        'city_id' :city_id,

      };
      String jsonData = jsonEncode(data);

      var response = await http.patch(
        Uri.parse('https://khiwater.com/api/vendors/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,


      );


      if (response.statusCode == 200) {
        print('vendors updated successfully');
      } else {
        print('Failed to update vendors . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating vendors : $e');
    }
  }


  Future<void> deleteVendors(int id) async {
    try {

      var response = await http.delete(
        Uri.parse('https://khiwater.com/api/vendors/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );


      if (response.statusCode == 200) {
        print('vendors deleted successfully');
      }
      else {
        print('Failed to delete vendors . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting vendors : $e');
    }
  }
}