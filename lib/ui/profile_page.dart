import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
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
                        padding: EdgeInsets.only(top: 160, left: 15, right: 15),
                        child: Column(
                          children: <Widget>[
                            CustomCard(
                              container: Container(
                                child: Column(children: [
                                  Container(
                                    height: 20,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                          builder: (_, state) => Text(
                                            state.currentValue,
                                            style: GoogleFonts.montserrat(
                                              fontSize: 14,
                                              color: Color(0xFF555555),
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        BlocBuilder<ProfileBloc, ProfileState>(
                                            builder: (_, state) => (FlatButton(
                                                  padding: EdgeInsets.all(0),
                                                  height: 14,
                                                  child: Text(
                                                    state.nextValue,
                                                    style:
                                                        GoogleFonts.montserrat(
                                                      fontSize: 14,
                                                      color: Color(0xFF358BFC),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    (state is ProfileInitial)
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
                                  BlocBuilder<ProfileBloc, ProfileState>(
                                      builder: (_, state) {
                                    if (state is EditProfileValue)
                                      return ProfileEditComponent();
                                    else if (state is ChangePasswordValue)
                                      return ProfileChangePasswordComponent();
                                    else
                                      return ProfileComponent();
                                  }),
                                  BlocBuilder<ProfileBloc, ProfileState>(
                                    builder: (_, state) => (state
                                            is! ProfileInitial)
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
                                                                  ProfileDescriptionEvent());
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
                            BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (_, state) => (state is ProfileInitial)
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
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('images/avatar.png'))),
                        height: 196,
                        width: 196,
                        margin: EdgeInsets.only(bottom: 5),
                      ),
                    ),
                    Column(children: [
                      Text(
                        "BenAffleck",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Color(0xFF555555)),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "mail@affleck.com",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                            color: Color(0xFF555555)),
                        textAlign: TextAlign.center,
                      ),
                    ]),
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
