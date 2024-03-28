import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/customer_screens/bottle_Screen.dart';
import 'package:home_water_delivery_management_system/Screens/customer_screens/product_screen.dart';
import 'package:home_water_delivery_management_system/Screens/login_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_form.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/existing_bottles.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/product/existing_products.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_orders_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_progress_screen.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/product/product_form.dart';

class CustomerDashboard extends StatefulWidget {
  final Function logoutCallback;
  const CustomerDashboard({super.key, required this.logoutCallback});

  @override
  State<CustomerDashboard> createState() => _CustomerDashboardState();
}

class _CustomerDashboardState extends State<CustomerDashboard> {
  bool isAuth = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Customer dashboard"),
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
                    'User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),


                // ListTile(
                //   leading: Icon(Icons.water_drop, color: Colors.white),
                //   title: Text(
                //     'bottles',
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   onTap: () {
                //     Get.to(CustomerBottle());
                //   },
                // ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'products',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Get.to(CustomerProduct());
                  },
                ),
                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Vendors',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Get.to(VendorProgress());
                  },

                ),

                ListTile(
                  leading: Icon(Icons.water_drop, color: Colors.white),
                  title: Text(
                    'Order Progress',
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
