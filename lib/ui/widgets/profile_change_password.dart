import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/event/profile_event.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
class ProfileChangePasswordComponent extends StatefulWidget {
  @override
  _ProfileChangePasswordComponentState createState() => _ProfileChangePasswordComponentState();
}
class _ProfileChangePasswordComponentState extends State<ProfileChangePasswordComponent> {

  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              controller: controller,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password baru",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
              controller: controller2,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Konfirmasi password",
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
                            // print(controller.text);
                            if(controller.text == controller2.text)
                            context.read<ProfileBloc>().add(UpdatePasswordEvent(password: controller.text));
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
    );
  }
}
