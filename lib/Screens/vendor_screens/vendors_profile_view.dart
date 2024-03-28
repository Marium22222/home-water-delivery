import 'package:flutter/material.dart';
import 'package:home_water_delivery_management_system/services/vendors_service.dart';

import '../../models/vendors_model.dart';

class VendorProfileDisplay extends StatefulWidget {
  final int? id;
  const VendorProfileDisplay({super.key, required this.id});

  @override
  State<VendorProfileDisplay> createState() => _VendorProfileDisplayState();
}

class _VendorProfileDisplayState extends State<VendorProfileDisplay> {

 VendorsService vendSer1 = VendorsService();
 late Vendors? vendor;

@override
  void initState() {
    // TODO: implement initState

    getData(widget.id!);
    print(widget.id!);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"),),
      body: Column(
        children: [
          Row(
            children: [
              Text("Name",style: TextStyle(
                fontSize: 20
              ),),
              SizedBox(width: 20,),
              Container(
                decoration: BoxDecoration(
                  // color: Colors.blue,
                  border: Border.all(
                    color: Colors.black

                  )
                ),
                  child: Text(vendor!.name,style: TextStyle(
                      fontSize: 20
                  ),)),
            ],
          ),
          Row(
            children: [
              Text("phone 1",style: TextStyle(
          fontSize: 20
          ),),
              SizedBox(width: 20,),
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      border: Border.all(
                          color: Colors.black

                      )
                  ),
                  child: Text(vendor!.phone_1,style: TextStyle(
                      fontSize: 20
                  ),)),
            ],
          ),
          Row(
            children: [
              Text("phone 2",style: TextStyle(
    fontSize: 20
    ),),
              SizedBox(width: 20,),
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      border: Border.all(
                          color: Colors.black

                      )
                  ),
                  child: Text(vendor!.phone_2,style: TextStyle(
                      fontSize: 20
                  ),)),
            ],
          ),
          Row(
            children: [
              Text("address",style: TextStyle(
    fontSize: 20
    ),),
              SizedBox(width: 20,),
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      border: Border.all(
                          color: Colors.black

                      )
                  ),
                  child: Text(vendor!.address,style: TextStyle(
                      fontSize: 20
                  ),)),
            ],
          ),
          Row(
            children: [
              Text("city",style: TextStyle(
    fontSize: 20
    ),),
              SizedBox(width: 20,),
              Container(
                  decoration: BoxDecoration(
                    // color: Colors.blue,
                      border: Border.all(
                          color: Colors.black

                      )
                  ),
                  child: Text(vendor!.city,style: TextStyle(
                      fontSize: 20
                  ),)),
            ],
          ),
        ],
      ),

    );
  }
 void getData(int id) async {
vendor = await vendSer1.getVendors(id);
   setState(() {

   });
 }
}
