import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatefulWidget {
  final String label;
  final List<String> items;
  CustomDropdownFormField({this.label, this.items});
  @override
  _CustomDropdownFormFieldState createState() =>
      _CustomDropdownFormFieldState();
}

class _CustomDropdownFormFieldState extends State<CustomDropdownFormField> {
  bool hidePassword = true;
  String _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 7),
      child: FormField(
        
        builder: (FormFieldState<String> state) {
          return DropdownButtonFormField<String>(
            decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(13),
                labelText: widget.label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            value: _currentSelectedValue,
            validator: (value) =>
            value == null ? widget.label + " harus diisi" : null,
            isDense: true,
            onChanged: (String newValue) {
              setState(() {
                _currentSelectedValue = newValue;
                state.didChange(newValue);
              });
            },
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
