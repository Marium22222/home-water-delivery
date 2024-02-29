import 'package:flutter/material.dart';
import 'package:get/get.dart';


class VendorOrders extends StatefulWidget {
  const VendorOrders({super.key});

  @override
  State<VendorOrders> createState() => _VendorOrdersState();
}

class _VendorOrdersState extends State<VendorOrders> {
  int _currentStep = 0;
  // bool progvisible =false;
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
        title: Text("Received Orders"),
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
                  Text("Location: Gulistan e Jauhar"),
                  Text("Name: Marium Amir"),
                  Text("Jar details: 19 Litre Bottle"),
                  Text("Quantity: 2"),
                  ElevatedButton(onPressed: (){
                setState(() {
                  // progvisible=true;
                  _currentStep++;
                });

                  }, child: Text("Accept")),
                  ElevatedButton(onPressed: (){}, child: Text("Reject")),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // if (progvisible) // Only display the progress bar when it's visible
                          LinearProgressIndicator(
                            value: (_currentStep + 1) / 4, // current step out of total steps
                            minHeight: 10,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        SizedBox(height: 20),
                        Text(
                          'Step ${_currentStep + 1} of 4', // Displaying current step out of total steps
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     // _incrementStep(); // Incrementing step on button press
                        //     setState(() {
                        //       // progvisible = true;
                        //       _currentStep++;
                        //   // Show progress bar when button is clicked
                        //     });
                        //   },
                        //   child: Text('Accept'),
                        // ),
                      ],
                    ),
                  ),

                ],
              ),
            ),

          );
        },
      ),

    );
  }
}