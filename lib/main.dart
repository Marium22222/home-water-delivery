import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/login_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_dashboard.dart';
import 'package:home_water_delivery_management_system/network_utils/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/customer_screens/customers_dashboard.dart';
import 'Screens/profile_remake.dart';
void main() {
runApp(GetMaterialApp(
  home: Login(),
));
}





// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       title: 'Test App',
//       debugShowCheckedModeBanner: false,
//       home: CheckAuth(),
//     );
//   }
// }

// class CheckAuth extends StatefulWidget {
//   @override
//   _CheckAuthState createState() => _CheckAuthState();
// }
//
// class _CheckAuthState extends State<CheckAuth> {
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     Widget child;
//
//     if (isAuth) {
//
//       child = VendorDashboard(
//           logoutCallback: _logout);
//     } else {
//       child = Login();
//     }
//     return Scaffold(
//       key: _scaffoldKey,
//       body: child,
//     );
//   }
// }
