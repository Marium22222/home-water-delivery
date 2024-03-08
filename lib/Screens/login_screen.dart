import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_dashboard.dart';
import 'package:home_water_delivery_management_system/network_utils/api.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:home_water_delivery_management_system/Screens/register_screen.dart';

import '../classes/countries.dart';
import '../classes/custom_searchable_dropdown.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
  bool isAuth=false;
  void _logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('token');
    setState(() {
      isAuth = false;
    });
  }
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var phone;
  var password;
  var country_id;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Cant login incorrect credentials'),
            ),
          );
  }
  @override
  void initState() {
    // TODO: implement initState
    setCountry();
  }
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      // appBar: AppBar(title:Text("KHI WATER",style: TextStyle(color: Colors.blueGrey),),
      // backgroundColor: Colors.white,
      //
      // centerTitle: true,),
      key: _scaffoldKey,
      body: Container(
        // color: Colors.teal,
        decoration: BoxDecoration(
          image: DecorationImage(image:NetworkImage("https://images.prismic.io/swim-guide/d393facd-05c8-4625-a1dc-c441054ba65f_waves.png?auto=compress,format"),fit: BoxFit.cover),
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
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontFamily: "Times New Roman")),

                    SizedBox(height: 40,),
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
                                suffixIcon:
                                const Icon(Icons.keyboard_arrow_down_rounded),
                                // primaryColor: Colors.grey.shade700,
                                label: selectedCountryLabel,
                                // labelStyle: GoogleFonts.raleway(
                                //     fontWeight: FontWeight.w500,
                                //     fontSize: 14,
                                //     color: Colors.grey.shade700),
                                dropDownMenuItems: Countries.countries.map((item) {
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
                                    selectedCountryCode = value['code'].toString();
                                    selectedCountryDialCode =
                                        value['dial_code'].toString();
                                    selectedCountryEmoji = value['emoji'].toString();





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
                                  SizedBox(width: 20,),
                                  Expanded(
                                    child: Container(
                                      height: 55,
                                      constraints:
                                      const BoxConstraints(maxWidth: 280),
                                      margin:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                      child: TextFormField(
                                        style: TextStyle(color: Color(0xFF000000)),
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
                                        validator: (phoneValue) {
                                          if (phoneValue!.isEmpty) {
                                            return 'Please enter phone';
                                          }
                                          phone = selectedCountryDialCode!+phoneValue;
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // TextFormField(
                              //   style: TextStyle(color: Color(0xFF000000)),
                              //   cursorColor: Color(0xFF9b9b9b),
                              //   keyboardType: TextInputType.number,
                              //   decoration: InputDecoration(
                              //     prefixIcon: Icon(
                              //       Icons.countertops_rounded,
                              //       color: Colors.grey,
                              //     ),
                              //     hintText: "country id",
                              //     hintStyle: TextStyle(
                              //         color: Color(0xFF9b9b9b),
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.normal),
                              //   ),
                              //   validator: (countryValue) {
                              //     if (countryValue!.isEmpty) {
                              //       return 'Please enter country id';
                              //     }
                              //    country_id =countryValue;
                              //     return null;
                              //   },
                              // ),
                              // TextFormField(
                              //   style: TextStyle(color: Color(0xFF000000)),
                              //   cursorColor: Color(0xFF9b9b9b),
                              //   keyboardType: TextInputType.text,
                              //   decoration: InputDecoration(
                              //     prefixIcon: Icon(
                              //       Icons.phone,
                              //       color: Colors.grey,
                              //     ),
                              //     hintText: "Phone",
                              //     hintStyle: TextStyle(
                              //         color: Color(0xFF9b9b9b),
                              //         fontSize: 15,
                              //         fontWeight: FontWeight.normal),
                              //   ),
                              //   validator: (phoneValue) {
                              //     if (phoneValue!.isEmpty) {
                              //       return 'Please enter phone';
                              //     }
                              //     phone = selectedCountryDialCode!+phoneValue;
                              //     return null;
                              //   },
                              // ),
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
                                      _isLoading? 'Proccessing...' : 'Login',
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
                                      _login();
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
                                  builder: (context) => Register()));
                        },
                        child: Text(
                          'Create new Account',
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


  void _login() async{
    setState(() {
      _isLoading = true;
    });
    var data = {
      // 'country_id' : selectedCountryDialCode,
      'phone' : phone,
      'password' : password
    };

    var res = await Network().authData(data, 'auth/login');
    var body = json.decode(res.body);
    print("This is body");
    print(body);
    if(body['user'] != null){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      print('ok i am done to routing ');
      Get.to(VendorDashboard(logoutCallback: _logout,));
    }else{
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });

  }
}