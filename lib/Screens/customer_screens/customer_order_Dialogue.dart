import 'package:flutter/material.dart';

class CustomerOrderDialogue extends StatefulWidget {
  const CustomerOrderDialogue({super.key});

  @override
  State<CustomerOrderDialogue> createState() => _CustomerOrderDialogueState();
}

class _CustomerOrderDialogueState extends State<CustomerOrderDialogue> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Text("orders"),
),
    );
  }
}
