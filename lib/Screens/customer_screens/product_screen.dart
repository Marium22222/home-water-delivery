import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/customer_screens/customer_order_Dialogue.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_dialogue.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/product/product_dialogue.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_profile_form.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendors_profile_view.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';
import 'package:home_water_delivery_management_system/services/product_service.dart';

import '../../../models/bottles_model.dart';
import '../../../models/product_model.dart';


class CustomerProduct extends StatefulWidget {
  const CustomerProduct ({super.key,});

  @override
  State<CustomerProduct > createState() => _CustomerProductState();
}

class _CustomerProductState extends State<CustomerProduct > {
  var vendor_id;
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
        title: Text("Product"),
        centerTitle: true,
      ),
      body:ListView.builder(
        //to be modified
        itemCount: ProductList.length,
        itemBuilder: (BuildContext context, int index) {
          Product products = ProductList[index];

          return InkWell(
            onTap:(){
              showDialog(context: context,
                  builder: (context)=>
                      VendorProfileDisplay(
                          id :products.vendor_id
                      ));
            },
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child:  Image.network( products.image_url),),
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
                    Text(products.price.toString()),
                    Text(products.description),
                    Text(products.bottle_id.toString()),
                    ElevatedButton(onPressed: (){
                      showDialog(context: context,
                          builder: (context)=>
                      CustomerOrderDialogue());
                              // VendorExistingDialogue1
                              //   (productid:products.product_id,name:products.name,price:products.price,description:products.description ,bottle_id: products.bottle_id,));
                    },  child: Text("Order Now"))




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
    ProductList = await prodSer1.getProductsforCustomer();
    setState(() {});
  }
}

