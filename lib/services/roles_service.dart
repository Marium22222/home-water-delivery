import 'package:home_water_delivery_management_system/models/roles_model.dart';
import 'package:http/http.dart' as http;

class RolesService {
  Future<List<Roles>> getRoles() async {
    var client = http.Client();
    try {
      var response = await client.get(
          Uri.parse('https://khiwater.com/api/roles'));


      if (response.statusCode == 200) {

        List<Roles> rolesList = rolesFromJson(response.body);
        return rolesList;
      } else {

        throw Exception('Failed to load roles');
      }
    } finally {
      client.close();
    }
  }
}
