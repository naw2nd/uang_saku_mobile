import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/model/user.dart';

class ProfileEditComponent extends StatelessWidget {
  final User user;
  TextEditingController _txtCtrlUsername;
  TextEditingController _txtCtrlFullname;
  TextEditingController _txtCtrlEmail;
  TextEditingController _txtCtrlTempatLahir;
  TextEditingController _txtCtrlAlamat;
  TextEditingController _txtCtrlPhone;
  TextEditingController _txtCtrlTanggalLahir;
  DateTime _selectedDate;
  ProfileEditComponent({this.user}){
    _txtCtrlUsername = TextEditingController(text:user.username);
    _txtCtrlFullname = TextEditingController(text:user.nama);
    _txtCtrlEmail = TextEditingController(text:user.email);
    _txtCtrlTempatLahir = TextEditingController(text:user.tempatLahir);
    _txtCtrlAlamat = TextEditingController(text:user.alamat);
    _txtCtrlPhone = TextEditingController(text:user.noTelp);
    _txtCtrlTanggalLahir = TextEditingController(text: DateFormat.yMMMMd('en_US').format(user.tglLahir));
    _selectedDate = user.tglLahir;

  }

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
        ..text = DateFormat.yMMMMd('en_US').format(_selectedDate)
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
