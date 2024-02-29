import 'package:flutter/material.dart';

class VendorProgress extends StatefulWidget {
  @override
  _VendorProgressState createState() => _VendorProgressState();
}

class _VendorProgressState extends State<VendorProgress> {
  int _currentStep = 0;
  bool progvisible =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('In progress orders status'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_currentStep < 3) {
                    _currentStep++; // Incrementing current step
                  }
                });
              },
              child: Text('Next Step'),
            ),
          ],
        ),
      ),
    );
  }
}
