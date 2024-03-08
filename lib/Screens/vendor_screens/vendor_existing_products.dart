import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_exist_dialogue.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';
import 'package:home_water_delivery_management_system/services/product_service.dart';

import '../../models/bottles_model.dart';
import '../../models/product_model.dart';


class VendorExistingProduct extends StatefulWidget {
  const VendorExistingProduct({super.key});

  @override
  State<VendorExistingProduct> createState() => _VendorExistingProductState();
}

class _VendorExistingProductState extends State<VendorExistingProduct> {
  @override
  void initState() {


    getData();
  }
//to be modified
  ProductService prodSer1 = ProductService();
  List<Product> ProductList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Existing product details"),
      ),
      body:ListView.builder(
        //to be modified
        itemCount: ProductList.length,
        itemBuilder: (BuildContext context, int index) {
          Product products = ProductList[index];

          return InkWell(
            onTap:(){
              // showDialog(context: context,
              //     builder: (context)=>
                      // VendorExistingDialogue
                      //   (id:bottles.bottle_id,size:bottles.size,name:bottles.name));

            },
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: Image.network("https://static6.depositphotos.com/1063437/556/i/450/depositphotos_5569996-stock-photo-polycarbonate-plastic-bottle-of-mineral.jpg"),),
              title: Container(
                decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  borderRadius: BorderRadius.circular(10), // Rounded corners
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 3), // Offset of the shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(products.name),
                    Text(products.description),
                    Text("Price"),
                    Text("description")
                    // Text("Blu Water"),
                    // Text("500 first advance")


                    // Text(items[index]),
                  ],
                ),
              ),

            ),
          );
        },
      ),

    );
  }
  //to be modified
  void getData() async {
    ProductList = await prodSer1.getProducts();
    setState(() {});
  }
}

