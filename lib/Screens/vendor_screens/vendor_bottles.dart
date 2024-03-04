import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorBottle extends StatefulWidget {
  @override
  _VendorBottleState createState() => _VendorBottleState();
}

class _VendorBottleState extends State<VendorBottle> {
  TextEditingController sizeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String dropdownValue = '1.5L Water Bottle';
  // Default value
  String dropdownValue1 = '1.5L ';




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
              onPressed: (){},
              child: Text('Insert'),
            ),
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue!;
            //     });
            //   },
            //   items: <String>['1.5L Water Bottle', '2L Water Bottle', '19L Water Gallon','21L Water Gallon'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            // DropdownButton<String>(
            //   value: dropdownValue1,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue1 = newValue!;
            //     });
            //   },
            //   items: <String>['1.5L ', '2L ', '19L ','21L'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),



          ],
        ),
      ),
    );
  }
}


