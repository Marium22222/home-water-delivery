import 'package:flutter/material.dart';
import 'package:home_water_delivery_management_system/models/bottles_model.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';
import 'package:home_water_delivery_management_system/services/product_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorProductUpdate extends StatefulWidget {
  final int id;
final int price;
  final String name;
  final String description;
  final int bottleid;
// final String lateBottle;


  const VendorProductUpdate({super.key, required this.id, required this.name, required this.price, required this.description, required this.bottleid,  });
  @override
  _VendorProductUpdateState createState() => _VendorProductUpdateState();
}

class _VendorProductUpdateState extends State<VendorProductUpdate> {
  //
  // String bottle="5L Water Bottle";
  String? bottle;
  var bottle_id;
  var user_id;
  var user;

  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // TextEditingController advanceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  BottlesService botSer1 = BottlesService();
  List<Bottles> bottleList = [];


  ImagePicker picker = ImagePicker();
  late final pickedFile;

  Future<void> openCamera() async {
    picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from camera: ${pickedFile.path}');
    } else {
      print('No image selected from camera.');
    }
  }

  Future<void> openGallery() async {
    picker = ImagePicker();
    pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // You can handle the picked image file here
      print('Image picked from gallery: ${pickedFile.path}');
    } else {
      print('No image selected from gallery.');
    }
  }


  void initState() {

    nameController=TextEditingController(text:widget.name);
priceController = TextEditingController(text: widget.price.toString());

descController = TextEditingController(text: widget.description);

getData();
  }
  // late var bottle=widget.lateBottle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update your product'),
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
                value: bottleList[widget.bottleid].name,
                onChanged: (String? newValue) {
                  setState(() {
                  bottle = newValue!;
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
              ElevatedButton(
                onPressed: () async {
                  SharedPreferences localStorage = await SharedPreferences
                      .getInstance();
                  user = localStorage.getString('user');
                  user_id = 1;
                  print('user_id');
                  print(user_id);
                  ProductService().updateProduct(
                    widget.id,
                      descController.text, nameController.text,
                      bottle_id, priceController.text);
                  print(bottle_id);
                  print(user_id);
                  print(priceController.text);
                  print(bottle);

                },
                child: Text('Update'),
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


