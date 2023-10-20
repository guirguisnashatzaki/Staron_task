import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {

  String label;
  String? Function(String? value)? validator;
  TextEditingController controller;
  TextInputType inputType;

  CustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.label,
    required this.validator
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        label: Text(label),
      ),
      controller: controller,
      keyboardType: inputType,
    );
  }
}