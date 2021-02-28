import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/model/user.dart';
import 'package:uang_saku/ui/widgets/custom_card.dart';
import 'package:uang_saku/ui/widgets/profile_change_password.dart';
import 'package:uang_saku/ui/widgets/profile_component.dart';
import 'package:uang_saku/ui/widgets/profile_edit_component.dart';
import 'package:uang_saku/ui/widgets/profile_property.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = User();
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          child: SafeArea(
            child: ListView(children: [
              Container(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Profile",
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    IconButton(
                        icon: Icon(
                          Icons.exit_to_app,
                          color: Colors.white,
                        ),
                        onPressed: () {})
                  ],
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                topLeft: Radius.circular(100))),
                        padding: EdgeInsets.only(top: 100, left: 15, right: 15),
                        child: BlocBuilder<ProfileBloc, BaseState>(
                            builder: (_, childState) {
                          if (childState is ProfileState) {
                            user = childState.user;
                            return Column(
                              children: <Widget>[
                                Column(children: [
                                  Text(
                                    user.username,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 26,
                                        color: Color(0xFF555555)),
                                  ),
                                  Text(
                                    user.email,
                                    style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20,
                                        color: Color(0xFF555555)),
                                  ),
                                ]),
                                CustomCard(
                                  container: Container(
                                    child: Column(children: [
                                      Container(
                                        height: 20,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              (childState is EditProfileState)
                                                  ? "Edit Profile"
                                                  : (childState
                                                          is ChangePasswordState)
                                                      ? "Change Password"
                                                      : "",
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
                                                (childState is InitProfileState)
                                                    ? "Edit Profile"
                                                    : (childState
                                                            is EditProfileState)
                                                        ? "Change Password"
                                                        : "",
                                                style: GoogleFonts.montserrat(
                                                  fontSize: 14,
                                                  color: Color(0xFF358BFC),
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              onPressed: () {
                                                (childState is InitProfileState)
                                                    ? context
                                                        .read<ProfileBloc>()
                                                        .add(EditProfileEvent())
                                                    : context
                                                        .read<ProfileBloc>()
                                                        .add(
                                                            ChangePasswordEvent());
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                      (childState is InitProfileState)
                                          ? ProfileComponent(user: user)
                                          : (childState is EditProfileState)
                                              ? ProfileEditComponent(user: user)
                                              : ProfileChangePasswordComponent(),
                                      (childState is! InitProfileState)
                                          ? Container(
                                              margin: EdgeInsets.only(
                                                  top: 10, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      flex: 15,
                                                      child: Container(
                                                        height: 40.0,
                                                        child: RaisedButton(
                                                          elevation: 0.0,
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    ProfileBloc>()
                                                                .add(
                                                                    ProfileEvent());
                                                          },
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          child: Ink(
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Cancel",
                                                                style: GoogleFonts.montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        18,
                                                                    color: Color(
                                                                        0xFF555555)),
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
                                                          onPressed: () {},
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  0.0),
                                                          child: Ink(
                                                            decoration:
                                                                BoxDecoration(
                                                                    gradient:
                                                                        LinearGradient(
                                                                      colors: [
                                                                        Color(
                                                                            0xFF358BFC),
                                                                        Color(
                                                                            0xFF3AE3CE)
                                                                      ],
                                                                      begin: Alignment
                                                                          .centerLeft,
                                                                      end: Alignment
                                                                          .centerRight,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10)),
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                "Save",
                                                                style: GoogleFonts.montserrat(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                ],
                                              ),
                                            )
                                          : Container()
                                    ]),
                                  ),
                                ),
                                BlocBuilder<ProfileBloc, BaseState>(
                                    builder: (_, state) => (state
                                            is InitProfileState)
                                        ? Container(
                                            child: Column(children: [
                                              Text(
                                                "Perusahaan",
                                                style: GoogleFonts.montserrat(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 24,
                                                    color: Color(0xFF555555)),
                                                textAlign: TextAlign.center,
                                              ),
                                              CustomCard(
                                                container: Container(
                                                    child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    ProfileProperty(
                                                        iconData:
                                                            Icons.business,
                                                        label:
                                                            "Wahana Meditek Indonesia, Surabaya",
                                                        value:
                                                            "Staff divisi HR"),
                                                    ProfileProperty(
                                                        iconData:
                                                            Icons.business,
                                                        label:
                                                            "Wahana Rizky Gumilang, Malang",
                                                        value:
                                                            "Staff divisi IT"),
                                                  ],
                                                )),
                                              ),
                                            ]),
                                          )
                                        : Container()),
                                SizedBox(
                                  height: 200,
                                ),
                              ],
                            );
                          } else {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                // height: Height.infinite,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          }
                        }),
                      ),
                    ],
                  ),
                  Column(children: [
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                // image: AssetImage('images/woman.png'))),
                                image: (user.gender == "Perempuan")
                                    ? AssetImage('images/woman.png')
                                    : AssetImage('images/man.png'))),
                        height: 196,
                        width: 196,
                        margin: EdgeInsets.only(bottom: 5),
                      ),
                    ),
                  ]),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
