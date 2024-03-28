import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:home_water_delivery_management_system/models/bottles_model.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';
import 'package:home_water_delivery_management_system/services/product_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class VendorProduct extends StatefulWidget {
  @override
  _VendorProductState createState() => _VendorProductState();
}

class _VendorProductState extends State<VendorProduct> {

  var bottle;
  var bottle_id;
  var user_id;
  var user;

  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController advanceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  BottlesService botSer1 = BottlesService();
  List<Bottles> bottleList = [];

//for open camera and gallery code............................................
  final ImagePicker picker = ImagePicker();
  XFile? pickedFile;


  String? imageUrl;
  String baseUrl = "https://khiwater.com/storage/";
  String? fullURL;

  Future<void> openGallery() async {

    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from gallery: ${pickedFile!.path}');

      // Send the image to the specified endpoint
      await sendImage(pickedFile!.path);
    } else {
      print('No image selected from gallery.');
    }
  }


  Future<void> openCamera() async {

    pickedFile = await picker.pickImage(source: ImageSource.camera);
print(pickedFile);
    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image captured from camera: ${pickedFile!.path}');

      // Send the image to the specified endpoint
      await sendImage(pickedFile!.path);
    } else {
      print('No image captured from camera.');
    }
  }

  Future<String?> sendImage(String imagePath) async {
    try {
      // Read the image file as bytes
      File imageFile = File(imagePath);
      List<int> imageBytes = await imageFile.readAsBytes();

      // Convert bytes to base64
      String base64Image = base64Encode(imageBytes);

      // Prepare the request with base64 data
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://khiwater.com/api/saveimg'),
      );
      request.fields['image'] = base64Image;

      // Send the request
      var streamedResponse = await request.send();

      // Get response
      var response = await http.Response.fromStream(streamedResponse);
      print('Server response: ${response.body}');
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      // Extract image URL
      imageUrl = jsonResponse['image_url'];
      fullURL = baseUrl + (imageUrl ?? "");

      print(imageUrl);
      // Check response status
      if (response.statusCode == 201) {
        print('Image sent successfully');

      } else {
        print('Failed to send image. Status code: ${response.statusCode}');

      }
    } catch (e) {
      print('Error sending image: $e');
    }
    return imageUrl;
  }


  void initState() {
    getData();
pickedFile;
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

              DropdownButtonFormField<String>(
                value: bottle,
                onChanged: (String? newValue) {
                  setState(() {
                    bottle = newValue;
                    bottle_id=bottleList.firstWhere((element) => element.name == newValue).bottle_id;

                  });
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.grey,
                  ),
                  hintText: "Select bottle",
                  hintStyle: TextStyle(
                    color: Color(0xFF9b9b9b),
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a role';
                  }
                  return null;
                },

                items: bottleList != null
                    ? bottleList.map((bottle) {
                  return DropdownMenuItem<String>(
                    value: bottle.name,
                    child: Text(bottle.name),
                  );
                }).toList():[],
              ),


              SizedBox(height: 10),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
              ),
              SizedBox(height: 10),

              SizedBox(height: 10),
              TextFormField(
                controller: descController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 20),

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

              pickedFile == null
                  ? Container(
                width: 200,
                height: 200,
                color: Colors.grey,
                child: Center(
                  child: Text('No image selected'),
                ),
              )
                  : Image.file(
                File(pickedFile!.path),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences localStorage = await SharedPreferences
                      .getInstance();

                  ProductService().sendProduct(descController.text,
                      nameController.text,
                      bottle_id, priceController.text,fullURL);
                  print(bottle);
                  print(fullURL);

                },
                child: Text('Insert'),
              ),
            ]
        ),
      ),
    );
  }

  void getData() async {
    bottleList = await botSer1.getBottles();
    setState(() {});
  }
}


