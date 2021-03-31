import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatepicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  CustomDatepicker({this.controller, this.label});
  @override
  _CustomDatepickerState createState() => _CustomDatepickerState();
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7, bottom: 7),
      child: TextFormField(
          focusNode: AlwaysDisabledFocusNode(),
          controller: widget.controller,
          validator: (value) =>
              value.isEmpty ? widget.label + " harus diisi" : null,
          decoration: InputDecoration(
              // suffixIcon: Icon(Icons.event_note),
              labelText: widget.label,
              isDense: true,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
          onTap: () {
            _selectDate(context);
          }),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(1965),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      widget.controller
        ..text = DateFormat.yMMMMd('en_US').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: widget.controller.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
