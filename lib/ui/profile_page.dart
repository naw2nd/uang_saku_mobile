import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/ui/widgets/custom_card.dart';
import 'package:uang_saku/ui/widgets/profile_change_password.dart';
import 'package:uang_saku/ui/widgets/profile_component.dart';
import 'package:uang_saku/ui/widgets/profile_edit_component.dart';
import 'package:uang_saku/ui/widgets/profile_property.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                        child: Column(
                          children: <Widget>[
                            BlocBuilder<ProfileBloc, BaseState>(
                              builder: (_, state) => (state is InitProfileState)
                                  ? Column(children: [
                                      Text(
                                        state.user.username,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 26,
                                            color: Color(0xFF555555)),
                                      ),
                                      Text(
                                        state.user.email,
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20,
                                            color: Color(0xFF555555)),
                                      ),
                                    ])
                                  : (state is EditProfileState)
                                      ? Text(
                                          "Edit Profile",
                                          style: GoogleFonts.montserrat(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 26,
                                              color: Color(0xFF555555)),
                                        )
                                      : (state is ChangePasswordState)
                                          ? Text(
                                              "Change Password",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 26,
                                                  color: Color(0xFF555555)),
                                            )
                                          : Text(""),
                            ),
                            CustomCard(
                              container: Container(
                                child: Column(children: [
                                  Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        BlocBuilder<ProfileBloc, BaseState>(
                                            builder: (_, state) => (FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  height: 17,
                                                  child: Text(
                                                    (state is InitProfileState)
                                                        ? "Edit Profile"
                                                        : (state
                                                                is EditProfileState)
                                                            ? "Change Password"
                                                            : "",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      color: Color(0xFF358BFC),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    (state is InitProfileState)
                                                        ? context
                                                            .read<ProfileBloc>()
                                                            .add(
                                                                EditProfileEvent())
                                                        : context
                                                            .read<ProfileBloc>()
                                                            .add(
                                                                ChangePasswordEvent());
                                                  },
                                                )))
                                      ],
                                    ),
                                  ),
                                  BlocBuilder<ProfileBloc, BaseState>(
                                      builder: (_, state) {
                                    if (state is InitProfileState)
                                      return ProfileComponent(user: state.user);
                                    else if (state is EditProfileState)
                                      return ProfileEditComponent(
                                        user: state.user,
                                      );
                                    else if (state is ChangePasswordState)
                                      return ProfileChangePasswordComponent();
                                    else
                                      return Center(
                                          child: CircularProgressIndicator());
                                  }),
                                  BlocBuilder<ProfileBloc, BaseState>(
                                    builder: (_, state) => (state
                                                is EditProfileState ||
                                            state is ChangePasswordState)
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
                                                            EdgeInsets.all(0.0),
                                                        child: Ink(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Cancel",
                                                              style: GoogleFonts.montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 18,
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
                                                            EdgeInsets.all(0.0),
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
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              "Save",
                                                              style: GoogleFonts.montserrat(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 18,
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
                                        : Container(),
                                  ),
                                ]),
                              ),
                            ),
                            BlocBuilder<ProfileBloc, BaseState>(
                                builder: (_, state) => (state is InitProfileState)
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
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                ProfileProperty(
                                                    iconData: Icons.business,
                                                    label:
                                                        "Wahana Meditek Indonesia, Surabaya",
                                                    value: "Staff divisi HR"),
                                                ProfileProperty(
                                                    iconData: Icons.business,
                                                    label:
                                                        "Wahana Rizky Gumilang, Malang",
                                                    value: "Staff divisi IT"),
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
                        ),
                      ),
                    ],
                  ),
                  Column(children: [
                    Center(
                      child: BlocBuilder<ProfileBloc, BaseState>(
                        builder: (_, state) => Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: (state is ProfileState && state.user.gender == "Perempuan") ? AssetImage('images/woman.png') : AssetImage('images/man.png'))),
                          height: 196,
                          width: 196,
                          margin: EdgeInsets.only(bottom: 5),
                        ),
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
