import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/forgot_password_event.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';
import 'package:uang_saku/bloc/state/forgot_password_state.dart';
import 'custom_widgets/custom_text_form_field.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final TextEditingController passwordController1 = TextEditingController();
  final TextEditingController passwordController2 = TextEditingController();
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  final _formKey = GlobalKey<FormState>();
  bool _hidePassword = true;
  String currentText = "";
  String selectedImage = "images/otp.png";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<ForgotPasswordBloc, BaseState>(
        builder: (_, state) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Color(0xFF555555)),
                onPressed: () {
                  BlocProvider.of<ForgotPasswordBloc>(context)
                      .add(ForgotPasswordEvent());
                  return Navigator.of(context).pop();
                },
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              title: Text(
                  (state is OTPVerifiedState || state is SuccesState<String>)
                      ? "Reset Password"
                      : (state is LoadingState)
                          ? ""
                          : "Verifikasi Email",
                  style: GoogleFonts.montserrat(
                    color: Color(0xFF555555),
                    fontWeight: FontWeight.w500,
                  ))),
          body: ListView(
            // alignment: WrapAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                // child: (state is LoadingState)
                //     ? Container()
                //     : Image(
                //         image: (state is OTPVerifiedState ||
                //                 state is SuccesState<String>)
                //             ? AssetImage('images/resetpass.png')
                //             : AssetImage('images/otp.png'),
                //       ),
                child: Image(
                  image: AssetImage(selectedImage),
                ),
              ),
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: (state is OTPVerifiedState)
                            ? EdgeInsets.all(0)
                            : EdgeInsets.only(top: 10, bottom: 10),
                        child: Text(
                          (state is EmptyState)
                              ? "Masukkan email untuk mendapatkan kode OTP"
                              : (state is EmailVerifiedState)
                                  ? "Masukkan kode OTP yang telah diterima melalui email anda"
                                  : (state is SuccesState<String>)
                                      ? state.data
                                      : (state is ErrorState)
                                          ? state.message
                                          : "",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(fontSize: 17),
                        ),
                      ),
                      (state is EmptyState)
                          ? CustomTextFormField(
                              controller: emailController,
                              label: "Email",
                              validation: ["email"],
                            )
                          : (state is EmailVerifiedState)
                              ? Container(
                                  child: PinCodeTextField(
                                      controller: pinController,
                                      errorAnimationController: errorController,
                                      onCompleted: (value) {
                                        print("Completed!");
                                      },
                                      pinTheme: PinTheme(
                                          fieldWidth: 47,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          inactiveColor: Colors.grey,
                                          shape: PinCodeFieldShape.box),
                                      backgroundColor: Color(0xFAFAFA),
                                      appContext: context,
                                      length: 6,
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        print(value);
                                        setState(() {
                                          currentText = value;
                                        });
                                      }),
                                )
                              : (state is OTPVerifiedState)
                                  ? Column(
                                      children: [
                                        Container(
                                          height: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              FlatButton(
                                                padding: EdgeInsets.all(0),
                                                height: 17,
                                                child: Text(
                                                  (_hidePassword)
                                                      ? "Show Password"
                                                      : "Hide Password",
                                                  style: GoogleFonts.montserrat(
                                                    fontSize: 14,
                                                    color: Color(0xFF358BFC),
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    _hidePassword =
                                                        !_hidePassword;
                                                  });
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: TextFormField(
                                              controller: passwordController1,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: TextFormField(
                                              controller: passwordController2,
                                              obscureText: _hidePassword,
                                              validator: (value) {
                                                print(value +
                                                    passwordController1.text);
                                                if (value !=
                                                    passwordController1.text) {
                                                  return "Konfirmasi password tidak sama";
                                                }
                                                return null;
                                              },
                                              decoration: InputDecoration(
                                                  labelText:
                                                      "Konfirmasi password baru",
                                                  isDense: true,
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)))),
                                        ),
                                      ],
                                    )
                                  : (state is LoadingState)
                                      ? Center(
                                          child: CircularProgressIndicator())
                                      : Container(),
                      (state is! LoadingState)
                          ? Container(
                              margin: EdgeInsets.only(top: 10),
                              height: 50,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    if (state is EmptyState) {
                                      BlocProvider.of<ForgotPasswordBloc>(
                                              context)
                                          .add(SendEmailEvent(
                                              email: emailController.text));
                                    } else if (state is EmailVerifiedState) {
                                      BlocProvider.of<ForgotPasswordBloc>(
                                              context)
                                          .add(VerifyOTPEvent(
                                              email: state.email,
                                              otp: pinController.text));
                                      setState(() {
                                        selectedImage = "images/resetpass.png";
                                      });
                                    } else if (state is OTPVerifiedState) {
                                      BlocProvider.of<ForgotPasswordBloc>(
                                              context)
                                          .add(ResetPasswordEvent(
                                              email: emailController.text,
                                              otp: state.otp,
                                              password:
                                                  passwordController1.text));
                                    } else {
                                      BlocProvider.of<ForgotPasswordBloc>(
                                              context)
                                          .add(ForgotPasswordEvent());
                                      Navigator.pop(context);
                                    }
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
                                      child: Text(
                                          (state is EmptyState)
                                              ? "Kirim Email"
                                              : (state is EmailVerifiedState)
                                                  ? "Verifikasi Kode"
                                                  : (state is OTPVerifiedState)
                                                      ? "Reset Password"
                                                      : "Kembali",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  // void dispose(){

  // }
}
