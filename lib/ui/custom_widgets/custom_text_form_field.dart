import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final List<String> validation;
  final int minimum;
  CustomTextFormField(
      {this.label, this.controller, this.validation, this.minimum});
  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 7),
      child: TextFormField(
          // keyboardType: (widget.lines == null)
          //     ? TextInputType.text
          //     : TextInputType.multiline,
          // maxLines: (widget.lines != null) ? widget.lines : null,
          controller: widget.controller,
          obscureText: (widget.validation.contains("password") && hidePassword)
              ? true
              : false,
          validator: (value) {
            if (widget.validation.contains("required") && value == "")
              return widget.label + " Harus diisi";
            if (widget.minimum != null && value.length < widget.minimum)
              return widget.label +
                  " Minimal " +
                  widget.minimum.toString() +
                  " karakter";
            if (widget.validation.contains("email") &&
                !EmailValidator.validate(value)) return "Email tidak valid";

            return null;
          },
          decoration: InputDecoration(
            labelText: widget.label,
            isDense: true,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            suffixIcon: (widget.validation.contains("password"))
                ? IconButton(
                    icon: Icon(
                        hidePassword ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                  )
                : null,
          )),
    );
  }
}
