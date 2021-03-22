import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/login_bloc.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';
import 'package:uang_saku/ui/forgot_password_page.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';
import '../model/models.dart';
import '../bloc/state/base_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage('images/logo.png'),
              width: 250,
              height: 250,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: emailController,
                      label: "Email",
                      validation: ["email"],
                    ),
                    CustomTextFormField(
                      controller: passwordController,
                      label: "Password",
                      minimum: 6,
                      validation: ["password"],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              child: Checkbox(
                                value: remember,
                                onChanged: (value) {
                                  setState(() {
                                    remember = value;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Remember Me",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: (!remember)
                                      ? FontWeight.w500
                                      : FontWeight.w600),
                            ),
                          ],
                        ),
                        TextButton(
                            child: Text(
                              "Lupa Password?",
                              style: GoogleFonts.roboto(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => EmailPage()));
                            })
                      ],
                    ),
                    BlocBuilder<LoginBloc, BaseState>(builder: (_, state) {
                      if (state is LoadingState)
                        return Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(top: 20),
                            child: CircularProgressIndicator());

                      return Wrap(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 20),
                            height: 50,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              padding: EdgeInsets.all(0),
                              elevation: 0,
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  BlocProvider.of<LoginBloc>(context).add(
                                      LoginEvent(
                                          email: emailController.text,
                                          password: passwordController.text));
                                }
                              },
                              child: Container(
                                child: Ink(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(colors: [
                                        Color(0xFF358BFC),
                                        Color(0xFF3AE3CE)
                                      ])),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Login",
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          (state is ErrorState)
                              ? Center(
                                  child: Text(state.message,
                                      style: GoogleFonts.montserrat(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.w500)),
                                )
                              : Container()
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
