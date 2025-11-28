import 'package:flutter/material.dart';

class AddEvenPage extends StatefulWidget {
  const AddEvenPage({super.key});

  @override
  State<AddEvenPage> createState() => _AddEvenPageState();
}

class _AddEvenPageState extends State<AddEvenPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: Text("Nom conference"),
            ),
          )
        ],
      ),
    );
  }
}
