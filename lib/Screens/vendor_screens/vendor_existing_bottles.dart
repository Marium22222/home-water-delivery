import 'package:flutter/material.dart';

class VendorExistingBottles extends StatefulWidget {
  const VendorExistingBottles({super.key});

  @override
  State<VendorExistingBottles> createState() => _VendorExistingBottlesState();
}

class _VendorExistingBottlesState extends State<VendorExistingBottles> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vendor Existing bottles"),
        centerTitle: true,
      ),
    );
  }
}
