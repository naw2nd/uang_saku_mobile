import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProfileEditComponent extends StatelessWidget {
  TextEditingController _txtCtrlUsername =
      TextEditingController(text: "BenAffleck");
  TextEditingController _txtCtrlFullname =
      TextEditingController(text: "Casey Affleck");
  TextEditingController _txtCtrlEmail =
      TextEditingController(text: "mail@affleck.com");
  TextEditingController _txtCtrlTempatLahir =
      TextEditingController(text: "Jakarta");
  TextEditingController _txtCtrlAlamat =
      TextEditingController(text: "Onigashima");
  TextEditingController _txtCtrlPhone =
      TextEditingController(text: "085940870012");
  TextEditingController _txtCtrlTanggalLahir =
      TextEditingController(text: "12/3/1994");
  DateTime _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: _txtCtrlUsername,
                decoration: InputDecoration(
                    labelText: "Username",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: _txtCtrlFullname,
                decoration: InputDecoration(
                    labelText: "Full Name",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: _txtCtrlEmail,
                decoration: InputDecoration(
                    labelText: "Email",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 15,
                  child: TextField(
                      controller: _txtCtrlTempatLahir,
                      decoration: InputDecoration(
                          labelText: "Tempat lahir",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 15,
                  child: TextField(
                      focusNode: AlwaysDisabledFocusNode(),
                      controller: _txtCtrlTanggalLahir,
                      decoration: InputDecoration(
                          labelText: "Tanggal lahir",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onTap: () {
                        _selectDate(context);
                      }),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: _txtCtrlAlamat,
                decoration: InputDecoration(
                    labelText: "Alamat",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: _txtCtrlPhone,
                decoration: InputDecoration(
                    labelText: "No Telepon",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
        ],
      ),
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
      _txtCtrlTanggalLahir
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _txtCtrlTanggalLahir.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}