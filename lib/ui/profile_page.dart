import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/profile_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/ui/splash_screen.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/profile_change_password_component.dart';
import 'package:uang_saku/ui/custom_widgets/profile_component.dart';
import 'package:uang_saku/ui/custom_widgets/profile_edit_component.dart';
import 'package:uang_saku/ui/custom_widgets/profile_property.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _controller = ScrollController();

  @override
  void initState() {
    context.read<ProfileBloc>().add(ProfileEvent());
    super.initState();
  }

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
            child: FadingEdgeScrollView.fromScrollView(
              gradientFractionOnEnd: 0,
              child: ListView(controller: _controller, children: [
                Container(
                  height: 40,
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
                          onPressed: () {
                            context.read<LoginBloc>().add(LogoutEvent());
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplashScreen()));
                          })
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
                          constraints: new BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height - 164,
                          ),
                          decoration: BoxDecoration(
                              color: Color(0xFFF7F7F7),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(100),
                                  topLeft: Radius.circular(100))),
                          padding: EdgeInsets.only(top: 100),
                          child: BlocBuilder<ProfileBloc, BaseState>(
                              builder: (_, state) {
                            if (state is ProfileState) {
                              return Column(
                                children: <Widget>[
                                  Column(children: [
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
                                  ]),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                                    child: CustomCard(
                                      container: Container(
                                        child: Column(children: [
                                          Container(
                                            height:
                                                (state is ChangePasswordState)
                                                    ? 0
                                                    : 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  (state is EditProfileState)
                                                      ? "Edit Profile"
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
                                                )
                                              ],
                                            ),
                                          ),
                                          (state is InitProfileState)
                                              ? ProfileComponent(
                                                  user: state.user)
                                              : (state is EditProfileState)
                                                  ? ProfileEditComponent(
                                                      user: state.user)
                                                  : ProfileChangePasswordComponent(),
                                        ]),
                                      ),
                                    ),
                                  ),
                                  (state is InitProfileState)
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
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  15, 10, 15, 15),
                                              child: CustomCard(
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
                                            ),
                                          ]),
                                        )
                                      : Container(),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              );
                            } else {
                              return Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            }
                          }),
                        ),
                      ],
                    ),
                    Center(
                      child: BlocBuilder<ProfileBloc, BaseState>(
                        builder: (_, state) => Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: (state is ProfileState)
                                  ? DecorationImage(
                                      fit: BoxFit.fill,
                                      image: (state.user.jenisKelamin ==
                                              "Perempuan")
                                          ? AssetImage('images/woman.png')
                                          : AssetImage('images/man.png'))
                                  : null),
                          height: 196,
                          width: 196,
                          margin: EdgeInsets.only(bottom: 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
