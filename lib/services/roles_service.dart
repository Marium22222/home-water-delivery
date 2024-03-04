import 'package:home_water_delivery_management_system/models/roles_model.dart';
import 'package:http/http.dart' as http;

class RolesService {
  Future<List<Roles>> getRoles() async {
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('http://167.71.238.72/api/roles'));

      // Check if the response status code is 200 (OK)
      if (response.statusCode == 200) {
        // Parse the JSON response into a list of Roles objects
        List<Roles> rolesList = rolesFromJson(response.body);
        return rolesList;
      } else {
        // If the response status code is not 200, throw an exception
        throw Exception('Failed to load roles');
      }
    } finally {
      client.close();
    }
  }
}
