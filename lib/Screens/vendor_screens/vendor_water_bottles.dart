import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorBottles extends StatefulWidget {
  @override
  _VendorBottlesState createState() => _VendorBottlesState();
}

class _VendorBottlesState extends State<VendorBottles> {
  TextEditingController priceController = TextEditingController();
  TextEditingController mlController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController brandController = TextEditingController();

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
        title: Text('Add a bottle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: mlController,
              decoration: InputDecoration(labelText: 'ML'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: advanceController,
              decoration: InputDecoration(labelText: 'First Advance'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: brandController,
              decoration: InputDecoration(labelText: 'Brand Name'),
            ),
            SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}


