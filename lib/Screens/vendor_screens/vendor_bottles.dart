import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:home_water_delivery_management_system/services/bottle_service.dart';


class VendorBottle extends StatefulWidget {
  @override
  _VendorBottleState createState() => _VendorBottleState();
}

class _VendorBottleState extends State<VendorBottle> {
  TextEditingController sizeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // String dropdownValue = '1.5L Water Bottle';
  // // Default value
  // String dropdownValue1 = '1.5L ';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your bottle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),

            ),
            TextFormField(
              controller: sizeController,
              decoration: InputDecoration(labelText: 'Size'),

            ),
            ElevatedButton(
              onPressed: (){
                BottlesService().sendBottles(sizeController.text,nameController.text);
              },
              child: Text('Insert'),
            ),
           


          ],
        ),
      ),
    );
  }
}


