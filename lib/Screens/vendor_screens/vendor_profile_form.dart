import 'package:custom_searchable_dropdown/custom_searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:home_water_delivery_management_system/classes/cities.dart';
import 'package:home_water_delivery_management_system/services/vendors_service.dart';

class VendorProfile extends StatefulWidget {
  const VendorProfile({super.key});

  @override
  State<VendorProfile> createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {

  var selectedCity;

  setCountry() {
    final pak = Cities.cities
        .firstWhere((city) => city['name'] == 'Abbottabad');

  }

  //text editing controllers
  TextEditingController nameController =TextEditingController();
  TextEditingController phone1Controller =TextEditingController();
  TextEditingController phone2Controller =TextEditingController();
  TextEditingController addressController =TextEditingController();
@override
  void initState() {

    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Vendor Profile"),),
      body:        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomSearchableDropDown(
              dropdownItemStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600),
              items: Cities.cities,
              suffixIcon:
              const Icon(Icons.keyboard_arrow_down_rounded),

              dropDownMenuItems: Cities.cities.map((item) {
                return item['name'];
              }).toList(),
              prefixIcon: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  "city"

                ),
              ),
              onChanged: (value) {
                setState(() {
                  selectedCity=value['name'];
                  print(value['name']);
                });
              }, label: 'Abbottabad',
            ),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),

            ),
            TextFormField(
              controller: phone1Controller,
              decoration: InputDecoration(labelText: 'Phone 1'),

            ),
            TextFormField(
              controller: phone2Controller,
              decoration: InputDecoration(labelText: 'Phone 2'),

            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: 'Address'),

            ),

        Text("Please upload an image of your card"),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){},
              child: Text('Open Camera'),
            ),
            ElevatedButton(
              onPressed: (){},
              child: Text('Upload'),
            ),


        ]
      ),
            Text("Please upload an image of your shop"),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                ElevatedButton(
                  onPressed: (){},
                  child: Text('Open Camera'),
                ),
                ElevatedButton(
                  onPressed: (){},
                  child: Text('Upload'),
                ),

              ],
            ),
            ElevatedButton(onPressed: (){

VendorsService().sendVendors(nameController.text, phone1Controller.text,
    phone2Controller.text, addressController.text, selectedCity.toString());

            }, child: Text("Insert"))
        ]

        ),
      ),

    );
  }
}
