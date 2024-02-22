import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_water_bottles.dart';

class VendorDashboard extends StatefulWidget {
  const VendorDashboard({super.key});

  @override
  State<VendorDashboard> createState() => _VendorDashboardState();
}

class _VendorDashboardState extends State<VendorDashboard> {
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
                    // Get.to(VendorExistingBottles());
                  },
                ),
              ],
            ),
          ),
        )
    );
  }
}
