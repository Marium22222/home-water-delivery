import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://167.71.238.72/api/';
  // If you are using Android Studio emulator, change localhost to 10.0.2.2
  var token;

  Future<void> _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    String? tokenJson = localStorage.getString('token');
    if (tokenJson != null) {
      token = jsonDecode(tokenJson);
    } else {
      // Handle case where token is not found in SharedPreferences
      // You might want to throw an error, provide a default token value, or handle it in some other way based on your application logic.
    }
  }

  Future<http.Response> authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

  Future<http.Response> getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  Map<String, String> _setHeaders() {
    return {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
}
