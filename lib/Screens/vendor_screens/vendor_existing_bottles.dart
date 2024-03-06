import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/vendor_exist_dialogue.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';

import '../../models/bottles_model.dart';


class VendorExistingDetails extends StatefulWidget {
  const VendorExistingDetails({super.key});

  @override
  State<VendorExistingDetails> createState() => _VendorExistingDetailsState();
}

class _VendorExistingDetailsState extends State<VendorExistingDetails> {
  @override
  void initState() {


    getData();
  }

  BottlesService botSer1 = BottlesService();
  List<Bottles> bottleList = [];
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Existing bottle details"),
      ),
      body:ListView.builder(
        itemCount: bottleList.length,
        itemBuilder: (BuildContext context, int index) {
          Bottles bottles = bottleList[index];
          return InkWell(
            onTap:(){
               showDialog(context: context,
                              builder: (context)=>VendorExistingDialogue(id:bottles.bottle_id,size:bottles.size,name:bottles.name));
          
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
                    Text(bottles.name),
                    Text(bottles.size),
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
  void getData() async {
    bottleList = await botSer1.getBottles();
    setState(() {});
  }
}

