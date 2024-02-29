import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VendorExistingDetails extends StatefulWidget {
  const VendorExistingDetails({super.key});

  @override
  State<VendorExistingDetails> createState() => _VendorExistingDetailsState();
}

class _VendorExistingDetailsState extends State<VendorExistingDetails> {
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Existing bottle details"),
      ),
      body:ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
                height: 50,
                child: Image.network("https://static6.depositphotos.com/1063437/556/i/450/depositphotos_5569996-stock-photo-polycarbonate-plastic-bottle-of-mineral.jpg"),),
            title: Container(
              decoration: BoxDecoration(
                color: Colors.white, // Background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5), // Shadow color
                    spreadRadius: 5, // Spread radius
                    blurRadius: 7, // Blur radius
                    offset: Offset(0, 3), // Offset of the shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text("19 Litre Bottle"),
                  Text("Rs. 330"),
                  Text("Blu Water"),
                  Text("500 first advance")


                  // Text(items[index]),
                ],
              ),
            ),

          );
        },
      ),

    );
  }
}