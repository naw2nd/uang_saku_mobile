import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/event/profile_event.dart';
import 'package:uang_saku/model/user.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';

class ProfileEditComponent extends StatefulWidget {
  final User user;
  ProfileEditComponent({this.user});
  @override
  _ProfileEditComponentState createState() => _ProfileEditComponentState();
}

class _ProfileEditComponentState extends State<ProfileEditComponent> {
  TextEditingController _txtCtrlUsername;
  TextEditingController _txtCtrlFullname;
  TextEditingController _txtCtrlEmail;
  TextEditingController _txtCtrlTempatLahir;
  TextEditingController _txtCtrlAlamat;
  TextEditingController _txtCtrlPhone;
  TextEditingController _txtCtrlTanggalLahir;
  DateTime _selectedDate;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _txtCtrlUsername = TextEditingController(text: widget.user.username);
    _txtCtrlFullname = TextEditingController(text: widget.user.nama);
    _txtCtrlEmail = TextEditingController(text: widget.user.email);
    _txtCtrlTempatLahir = TextEditingController(text: widget.user.tempatLahir);
    _txtCtrlAlamat = TextEditingController(text: widget.user.alamat);
    _txtCtrlPhone = TextEditingController(text: widget.user.noTelp);
    _txtCtrlTanggalLahir = TextEditingController(
        text: DateFormat.yMMMMd('en_US').format(widget.user.tglLahir));
    _selectedDate = widget.user.tglLahir;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextFormField(
              label: "Username",
              controller: _txtCtrlUsername,
              validation: ["required"],
            ),
            CustomTextFormField(
              label: "Full Name",
              controller: _txtCtrlFullname,
              validation: ["required"],
            ),
            CustomTextFormField(
              label: "Email",
              controller: _txtCtrlEmail,
              validation: ["required", "email"],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 15,
                    child: CustomTextFormField(
                      label: "Tempat lahir",
                      controller: _txtCtrlTempatLahir,
                      validation: ["required"],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  Flexible(
                    flex: 15,
                    child: TextFormField(
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
            CustomTextFormField(
              label: "Alamat",
              controller: _txtCtrlAlamat,
              validation: ["required"],
            ),
            CustomTextFormField(
              label: "Nomor Telepon",
              controller: _txtCtrlPhone,
              validation: ["required"],
              minimum: 12,
            ),
            BlocBuilder<ProfileBloc, BaseState>(
              builder: (_, state) => Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        flex: 15,
                        child: Container(
                          height: 40.0,
                          child: RaisedButton(
                            elevation: 0.0,
                            onPressed: () {
                              context.read<ProfileBloc>().add(ProfileEvent());
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Cancel",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Color(0xFF555555)),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                      flex: 1,
                      child: Container(),
                    ),
                    Flexible(
                        flex: 15,
                        child: Container(
                          height: 40.0,
                          child: RaisedButton(
                            elevation: 0.0,
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                User user = User(
                                    alamat: _txtCtrlAlamat.text,
                                    email: _txtCtrlEmail.text,
                                    nama: _txtCtrlFullname.text,
                                    noTelp: _txtCtrlPhone.text,
                                    tempatLahir: _txtCtrlTempatLahir.text,
                                    username: _txtCtrlUsername.text,
                                    tglLahir: _selectedDate);
                                context
                                    .read<ProfileBloc>()
                                    .add(UpdateProfileEvent(user: user));
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF358BFC),
                                      Color(0xFF3AE3CE)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Save",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
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
