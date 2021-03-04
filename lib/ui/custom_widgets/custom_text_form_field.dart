
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final List<String> validation;
  final int minimum;
  CustomTextFormField(
      {this.label, this.controller, this.validation, this.minimum});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
          controller: controller,
          validator: (value) {
            if (validation.contains("required") && value == "")
              return label + " Harus diisi";
            if (minimum != null && value.length < minimum)
              return label + " Minimal " + minimum.toString() + " karakter";
            if (validation.contains("email") && !EmailValidator.validate(value))
              return "Email tidak valid";

            return null;
          },
          decoration: InputDecoration(
              labelText: label,
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)))),
    );
  }
}
