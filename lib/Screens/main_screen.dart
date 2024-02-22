import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_dashboard.dart';
import 'package:home_water_delivery_management_system/Screens/customer_screens/customers_dashboard.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child:
            Text("Login")),
            ElevatedButton(onPressed: (){}, child:
            Text("Register")),
            ElevatedButton(onPressed: (){
               Get.to(VendorDashboard());
            }, child:
            Text("vendor")),
            ElevatedButton(onPressed: (){
               Get.to(CustomerDashboard());
            }, child:
            Text("customer"))
          ],
        ),
      ),
    );
  }
}
