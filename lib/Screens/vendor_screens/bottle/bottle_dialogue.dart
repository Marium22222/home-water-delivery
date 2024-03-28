import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_update.dart';
import 'package:home_water_delivery_management_system/Screens/vendor_screens/bottle/bottle_form.dart';
import 'package:home_water_delivery_management_system/services/bottle_service.dart';

class VendorExistingDialogue extends StatefulWidget {
  final int id;
  final String size;
  final String name;
  const VendorExistingDialogue({super.key, required this.id ,required this.size, required this.name,});

  @override
  State<VendorExistingDialogue> createState() => _VendorExistingDialogueState();
}

class _VendorExistingDialogueState extends State<VendorExistingDialogue> {
   @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      child: Center(
        child: Container(
          height: 500,
  width: 300,
  color: Colors.white,
         child: Padding(
           padding: const EdgeInsets.all(20.0),
           child: SingleChildScrollView(
             child: Column(
                children: [
                Text(widget.name),
                  Text(widget.size),
                  ElevatedButton(onPressed: (){
                    Get.to(VendorBottleUpdate
                      (id:widget.id,size:widget.size,name:widget.name));
                  }, child: Text("Update")),
                    ElevatedButton(onPressed: (){
                      BottlesService().deleteBottle(widget.id);
                    }, child: Text("Delete")),

                 
                ],
              ),
           ),
         )
        ),
      ),
    );
  }
}