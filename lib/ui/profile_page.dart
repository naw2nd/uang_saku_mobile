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
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
            ),
            elevation: 0.0,
            title: Text("Profile",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                ))),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          child: Stack(
            children: [
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 100,
                      // width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                        height: MediaQuery.of(context).size.height - 180,
                        decoration: BoxDecoration(
                            color: Color(0xFFF7F7F7),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(100),
                                topLeft: Radius.circular(100))),
                        padding: EdgeInsets.only(top: 160),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.05)
                              ],
                              stops: [0.9, 1],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Colors.white.withOpacity(0.05)
                                ],
                                stops: [0.9, 1],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: Container(
                              child: ListView(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                children: <Widget>[
                                  CustomCard(
                                    container: Container(
                                      child: Column(children: [
                                        Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BlocBuilder<ProfileBloc,
                                                  ProfileState>(
                                                builder: (_, state) => Text(
                                                  state.currentValue,
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    color: Color(0xFF555555),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                              BlocBuilder<ProfileBloc,
                                                      ProfileState>(
                                                  builder: (_, state) =>
                                                      (FlatButton(
                                                        child: Text(
                                                          state.nextValue,
                                                          style: GoogleFonts
                                                              .montserrat(
                                                            fontSize: 14,
                                                            color: Color(
                                                                0xFF358BFC),
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),
                                                        onPressed: () {
                                                          (state is ProfileInitial)
                                                              ? context
                                                                  .read<
                                                                      ProfileBloc>()
                                                                  .add(
                                                                      EditProfileEvent())
                                                              : context
                                                                  .read<
                                                                      ProfileBloc>()
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
                                          builder: (_, state) =>
                                              (state is! ProfileInitial)
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
                                                                child:
                                                                    RaisedButton(
                                                                  elevation:
                                                                      0.0,
                                                                  onPressed:
                                                                      () {
                                                                    context
                                                                        .read<
                                                                            ProfileBloc>()
                                                                        .add(
                                                                            ProfileDescriptionEvent());
                                                                  },
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  child: Ink(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10)),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        "Cancel",
                                                                        style: GoogleFonts.montserrat(
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Color(0xFF555555)),
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
                                                                child:
                                                                    RaisedButton(
                                                                  elevation:
                                                                      0.0,
                                                                  onPressed:
                                                                      () {},
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              0.0),
                                                                  child: Ink(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            gradient:
                                                                                LinearGradient(
                                                                              colors: [
                                                                                Color(0xFF358BFC),
                                                                                Color(0xFF3AE3CE)
                                                                              ],
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                    child:
                                                                        Container(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          Text(
                                                                        "Save",
                                                                        style: GoogleFonts.montserrat(
                                                                            fontWeight: FontWeight
                                                                                .w500,
                                                                            fontSize:
                                                                                18,
                                                                            color:
                                                                                Colors.white),
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
                                          builder: (_, state) => (state is ProfileInitial) ? Container(
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
                                    ) : Container()
                                  ),
                                  SizedBox(
                                    height: 200,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
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
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Ben Affleck",
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
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
