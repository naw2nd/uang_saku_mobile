import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatepicker extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final DateTime start;
  final DateTime end;
  CustomDatepicker({this.controller, this.label, this.start, this.end});
  @override
  _CustomDatepickerState createState() => _CustomDatepickerState();
}

class _CustomDatepickerState extends State<CustomDatepicker> {
  DateTime _selectedDate;
  bool showIcon = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 7, bottom: 7),
        child: TextFormField(
            readOnly: true,
            controller: widget.controller,
            validator: (value) =>
                value.isEmpty ? widget.label + " harus diisi" : null,
            decoration: InputDecoration(
                labelText: widget.label,
                isDense: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
            onTap: () {
              _selectDate(context);
            }));
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: (_selectedDate != null) ? _selectedDate : DateTime.now(),
        firstDate: (widget.start != null) ? widget.start : DateTime(1945),
        lastDate: (widget.end != null) ? widget.end : DateTime(2045),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });

    _selectedDate = newSelectedDate;
    widget.controller
      ..text = DateFormat.yMMMMd('en_US').format(_selectedDate)
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: widget.controller.text.length,
          affinity: TextAffinity.upstream));
  }
}
