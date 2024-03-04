import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorProduct extends StatefulWidget {
  @override
  _VendorProductState createState() => _VendorProductState();
}

class _VendorProductState extends State<VendorProduct> {
  String dropdownValue = '1.5L Water Bottle'; // Default value
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from camera: ${pickedFile.path}');
    } else {
      print('No image selected from camera.');
    }
  }

  Future<void> openGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from gallery: ${pickedFile.path}');
    } else {
      print('No image selected from gallery.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add your product'),
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
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['1.5L Water Bottle', '2L Water Bottle', '19L Water Gallon','21L Water Gallon'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),

            SizedBox(height: 10),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 10),
            // TextFormField(
            //   controller: advanceController,
            //   decoration: InputDecoration(labelText: 'First Advance'),
            // ),
            SizedBox(height: 10),
            TextFormField(
              controller: descController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            // DropdownButton<String>(
            //   value: dropdownValue,
            //   onChanged: (String? newValue) {
            //     setState(() {
            //       dropdownValue = newValue!;
            //     });
            //   },
            //   items: <String>['type1', 'type2', 'type3'].map((String value) {
            //     return DropdownMenuItem<String>(
            //       value: value,
            //       child: Text(value),
            //     );
            //   }).toList(),
            // ),
            Text("Please upload an image of your product"),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: openCamera,
                  child: Text('Open Camera'),
                ),
                ElevatedButton(
                  onPressed: openGallery,
                  child: Text('Upload'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Insert'),
            ),
          ],
        ),
      ),
    );
  }
}


