import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:home_water_delivery_management_system/services/bottle_service.dart';


class VendorBottleUpdate extends StatefulWidget {
  final int id;
 final String size;
  final String name;
  const VendorBottleUpdate({super.key,required this.id,required this.size, required this.name,});

  @override
  @override
  _VendorBottleUpdateState createState() => _VendorBottleUpdateState();
}

class _VendorBottleUpdateState extends State<VendorBottleUpdate> {
  late TextEditingController sizeController ;
  late TextEditingController nameController ;
  // String dropdownValue = '1.5L Water Bottle';
  // // Default value
  // String dropdownValue1 = '1.5L ';
@override
  void initState() {
   sizeController=TextEditingController(text:widget.size);
      nameController=TextEditingController(text:widget.name);

    
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update your bottle'),
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
                BottlesService().updateBottle(widget.id,sizeController.text,nameController.text);
                // print(${widget.id}+$widget.name+widget.size);
                print(widget.id);
                   print(widget.name);
                      print(widget.size);
              },
              child: Text('Update'),
            ),
           


          ],
        ),
      ),
    );
  }
}


