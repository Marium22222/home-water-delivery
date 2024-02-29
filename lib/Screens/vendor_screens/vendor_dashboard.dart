import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/login_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_existing_bottles.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_orders_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_progress_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_water_bottles.dart';

class VendorDashboard extends StatefulWidget {
  final Function logoutCallback;
  const VendorDashboard({super.key, required this.logoutCallback});

  @override
  State<VendorDashboard> createState() => _VendorDashboardState();
}

class _VendorDashboardState extends State<VendorDashboard> {
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Vendor dashboard"),
        ),
      ),
        drawer: Drawer(
          child: Container(
            color: Colors.blue, // Set your desired background color
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'Vendor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),

                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'New Bottle Details',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(VendorBottles());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Existing bottle details',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(VendorExistingDetails());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Vendor Orders',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(VendorOrders());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Vendor Progress',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(VendorProgress());
                  },

                ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Logout',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    widget.logoutCallback();
                    Get.to(Login());
                  },

                ),
              ],
            ),
          ),
        )
    );
  }
}
