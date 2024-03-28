import 'package:home_water_delivery_management_system/models/product_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class ProductService {
  Future <String> getToken() async {
    final SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? token = localStorage.getString('token');
    if (token == null) {
      throw Exception('Token is null');
    }
    token = token.replaceAll('"', '');
    return token;
  }
  Future<List<Product>> getProducts() async {
    var client = http.Client();
    try {
      String token = await getToken();
      print(token);
      var response = await client.get(Uri.parse('https://khiwater.com/api/vendorproducts'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }
      );


      if (response.statusCode == 200) {

        List<dynamic> jsonResponse = json.decode(response.body)['data'];
        List<Product> ProductList =
        jsonResponse.map((json) => Product.fromJson(json)).toList();
        return ProductList;
      } else {
        throw Exception('Failed to load products');
      }
    } finally {
      client.close();
    }
  }
  Future<List<Product>> getProductsforCustomer() async {
    var client = http.Client();
    try {
      // String token = await getToken();
      // print(token);
      var response = await client.get(Uri.parse('https://khiwater.com/api/products'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            // 'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          }
      );


      if (response.statusCode == 200) {

        List<dynamic> jsonResponse = json.decode(response.body)['data'];
        List<Product> ProductList =
        jsonResponse.map((json) => Product.fromJson(json)).toList();
        return ProductList;
      } else {
        throw Exception('Failed to load products');
      }
    } finally {
      client.close();
    }
  }
  Future<void> sendProduct(String description, String name,int bottle_id,String price,String? image) async {
    Map<String, dynamic> data = {
   'description': description,
      'name': name,
       'image_url':image,
      'bottle_id': bottle_id,
      'price' : price,


    };
    String jsonData = jsonEncode(data);
    String token = await getToken();
    String apiUrl = 'https://khiwater.com/api/products';

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


      if (response.statusCode == 200) {
        print('Data sent successfully');
        // Optionally, you can process the response from the API here
      } else {
        print('Failed to send data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending data: $e');
    }
  }
  Future<void> updateProduct(int id, String description, String name,int bottle_id,String price ) async {
    try {
      Map<String, dynamic> data = {
        'description': description,
        'name': name,
        'image_url':'image',
        'bottle_id': bottle_id,
        'price' : price

      };
      String jsonData = jsonEncode(data);

      var response = await http.patch(
        Uri.parse('https://khiwater.com/api/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,


      );


      if (response.statusCode == 200) {
        print('product updated successfully');
      } else {
        print('Failed to update product . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating product : $e');
    }
  }


  Future<void> deleteProduct(int id) async {
    try {

      var response = await http.delete(
        Uri.parse('https://khiwater.com/api/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );


      if (response.statusCode == 200) {
        print('product deleted successfully');
      }
      else {
        print('Failed to delete product . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product : $e');
    }
  }
}