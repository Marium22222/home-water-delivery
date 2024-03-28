import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_update.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_form.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/product/existing_products.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/product/product_update.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';
import 'package:home_water_delivery_management_system/services/product_service.dart';

class VendorExistingDialogue1 extends StatefulWidget {
  final String description;
  final int productid;
  final String name;
  final int price;
  final int bottle_id;

  VendorExistingDialogue1({super.key, required this.productid , required this.name, required this.price, required this.description, required this.bottle_id, });

  @override
  State<VendorExistingDialogue1> createState() => _VendorExistingDialogue1State();
}

class _VendorExistingDialogue1State extends State<VendorExistingDialogue1> {
  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Center(
        child: Container(
            height: 500,
            width: 300,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(widget.name),

                    Text(widget.price.toString()),
                    ElevatedButton(onPressed: (){
                      Get.to(VendorProductUpdate(id:widget.productid,name:widget.name,price:widget.price,description:widget.description,bottleid:widget.bottle_id));
                    }, child: Text("Update")),
                    ElevatedButton(onPressed: (){
                      ProductService().deleteProduct(widget.productid);
                      Get.to(VendorExistingProduct());
                    }, child: Text("Delete")),


                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}