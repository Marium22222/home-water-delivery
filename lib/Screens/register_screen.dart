import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';

import 'package:home_water_delivery_management_system/models/roles_model.dart';
import 'package:home_water_delivery_management_system/network_utils/api.dart';
import 'package:home_water_delivery_management_system/services/roles_service.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_water_delivery_management_system/Screens/login_screen.dart';

import '../classes/countries.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  RolesService RoleSer1 = RolesService();
  List<Roles> rolesList = [];

  //model of role and service of role above
  String dropdownValue = ''; // Default value
  // Map<String, String> dropdownItems = {
  //   'vendor': '1',
  //   'user': '2',
  //   'vendor_employee': '3',
  // };
  String? selectedCountryCode;
  String? selectedCountryDialCode;
  String? selectedCountryEmoji;
  String? selectedCountryLabel;
  setCountry() {
    final pak = Countries.countries
        .firstWhere((country) => country['name'] == 'Pakistan');

    if (pak.isNotEmpty) {
      selectedCountryCode = pak['code'];
      selectedCountryDialCode = pak['dial_code'];
      selectedCountryEmoji = pak['emoji'];
      selectedCountryLabel = 'Pakistan';
    }
  }

  bool isAuth = false;
  void _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    setState(() {
      isAuth = false;
    });
  }

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var country_id;
  var password;
  var name;
  var role;
  var phone;
  var roleid;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {

    setCountry();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      key: _scaffoldKey,
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://images.prismic.io/swim-guide/d393facd-05c8-4625-a1dc-c441054ba65f_waves.png?auto=compress,format"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("KHI WATER",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blueGrey,
                            fontFamily: "Times New Roman")),
                    SizedBox(
                      height: 40,
                    ),
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              CustomSearchableDropDown(
                                dropdownItemStyle: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade600),
                                items: Countries.countries,
                                suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down_rounded),
                                primaryColor: Colors.grey.shade700,
                                label: selectedCountryLabel,
                                dropDownMenuItems:
                                    Countries.countries.map((item) {
                                  return item['name'];
                                }).toList(),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Text(
                                    selectedCountryEmoji ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey.shade600),
                                  ),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCountryCode =
                                        value['code'].toString();
                                    selectedCountryDialCode =
                                        value['dial_code'].toString();
                                    selectedCountryEmoji =
                                        value['emoji'].toString();
                                  });
                                },
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Text(
                                      selectedCountryDialCode ?? '+',
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Container(
                                      height: 55,
                                      constraints:
                                          const BoxConstraints(maxWidth: 280),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      child: TextFormField(
                                        style:
                                            TextStyle(color: Color(0xFF000000)),
                                        cursorColor: Color(0xFF9b9b9b),
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          // prefixIcon: Icon(
                                          //   Icons.phone,
                                          //   color: Colors.grey,
                                          // ),
                                          hintText: "Phone",
                                          hintStyle: TextStyle(
                                              color: Color(0xFF9b9b9b),
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal),
                                        ),
                                        validator: (phonenumber) {
                                          if (phonenumber!.isEmpty) {
                                            return 'Please enter phone number';
                                          }
                                          phone = selectedCountryDialCode! +
                                              phonenumber;
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),


//for roles
                              DropdownButtonFormField<String>(
                                value: role,
                                onChanged: (newValue) {
                                  setState(() {
                                    role = newValue;
                                    //roleid = to pass when a role is selected from dropdown
                                    roleid =rolesList.firstWhere((element) => element.name == newValue).id;
                                    //not correct format

                                  });
                                },
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Select Role",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please select a role';
                                  }
                                  return null;
                                },

                                items: rolesList != null
                                    ? rolesList.map((role) {
                                  return DropdownMenuItem<String>(
                                    value: role.name,
                                    child: Text(role.name),
                                  );
                                }).toList():[],
                              ),
                              //end

                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.insert_emoticon,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Name",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (firstname) {
                                  if (firstname!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  name = firstname;
                                  return null;
                                },
                              ),


                              TextFormField(
                                style: TextStyle(color: Color(0xFF000000)),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Password",
                                  hintStyle: TextStyle(
                                      color: Color(0xFF9b9b9b),
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal),
                                ),
                                validator: (passwordValue) {
                                  if (passwordValue!.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: ElevatedButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading
                                          ? 'Proccessing...'
                                          : 'Register',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),

                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _register();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text(
                          'Already Have an Account',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'name': name,
      'country_id': selectedCountryDialCode,
      'phone': phone,
      'password': password,
      //passing the role id.
      'role_id': roleid
    };
    print(data);
    var res = await Network().authData(data, 'auth/register');
    var body = json.decode(res.body);
    print("This is body");
    print(body);
    // if(body['success'] != null && body['success']){
    if (body['user'] != null) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      print("I am here");
      Get.to(Login());
    }

    setState(() {
      _isLoading = false;
    });
  }

  void getData() async {
    rolesList = await RoleSer1.getRoles();
    setState(() {});
  }
}
