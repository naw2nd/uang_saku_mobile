import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/event/profile_event.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';

class ProfileChangePasswordComponent extends StatefulWidget {
  @override
  _ProfileChangePasswordComponentState createState() =>
      _ProfileChangePasswordComponentState();
}

class _ProfileChangePasswordComponentState
    extends State<ProfileChangePasswordComponent> {
  bool _hidePassword = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Change Password",
                    style: GoogleFonts.montserrat(
                      fontSize: 14,
                      color: Color(0xFF555555),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    height: 17,
                    child: Text(
                      (_hidePassword) ? "Show Password" : "Hide Password",
                      style: GoogleFonts.montserrat(
                        fontSize: 14,
                        color: Color(0xFF358BFC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        _hidePassword = !_hidePassword;
                      });
                    },
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                  controller: controller,
                  obscureText: _hidePassword,
                  validator: (value) {
                    if (value.length < 6) {
                      return "Password baru minimal 6 karakter";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Password baru",
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: TextFormField(
                  controller: controller2,
                  obscureText: _hidePassword,

                  validator: (value) {
                    print(value + controller.text);
                    if (value != controller.text) {
                      return "Konfirmasi password tidak sama";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      labelText: "Konfirmasi password baru",
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)))),
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
                                context.read<ProfileBloc>().add(
                                    UpdatePasswordEvent(
                                        password: controller.text));
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
}
