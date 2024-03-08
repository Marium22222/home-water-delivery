import 'package:home_water_delivery_management_system/models/product_model.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
class ProductService {
  Future<List<Product>> getProducts() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('http://167.71.238.72/api/products'));

      if (response.statusCode == 200) {
        // Parse the JSON response into a list of Product objects
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
  Future<void> sendProduct(String size, String name) async {
    Map<String, dynamic> data = {
      'size': size,
      'name': name,
    };
    String jsonData = jsonEncode(data);

    // Define the API endpoint URL
    String apiUrl = 'http://167.71.238.72/api/products';

    try {
      // Make a POST request to the API endpoint
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      // Check if the request was successful (status code 200)
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
  Future<void> updateProduct(int id, String name, String size) async {
    try {
      // Send a PUT request to update a product
      var response = await http.put(
        Uri.parse('http://167.71.238.72/api/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'size': size,
        }),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('product updated successfully');
      } else {
        print('Failed to update product . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error updating product : $e');
    }
  }

  // Function to delete a product
  Future<void> deleteProduct(int id) async {
    try {
      // Send a DELETE request to delete a product
      var response = await http.delete(
        Uri.parse('http://167.71.238.72/api/products/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        print('product deleted successfully');
      } else {
        print('Failed to delete product . Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error deleting product : $e');
    }
  }
}