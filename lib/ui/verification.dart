import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/verify_otp_event.dart';
import 'package:uang_saku/bloc/verifiy_otp_bloc.dart';

import 'package:uang_saku/ui/reset_password.dart';

class VerificationPage extends StatefulWidget {
  final String email;
  @override
  _VerificationPageState createState() => _VerificationPageState(email: email);

  VerificationPage({this.email});
}

class _VerificationPageState extends State<VerificationPage> {
  StreamController<ErrorAnimationType> errorController =
      StreamController<ErrorAnimationType>();
  bool hasError = false;
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController pinController = TextEditingController();
  String currentText = "";
  String email;

  _VerificationPageState({this.email});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Container(
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: Text("Verify OTP",
                    style: TextStyle(
                      color: Color(0xFF555555),
                      fontFamily: "montserrat",
                      fontWeight: FontWeight.w900,
                    )),
              ),
            ),
          ),
          key: scaffoldKey,
          body: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage('images/otp.png'),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: Text(
                            "Masukkan kode yang telah diterima melalui email anda",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: (18)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          child: PinCodeTextField(
                              controller: pinController,
                              errorAnimationController: errorController,
                              onCompleted: (value) {
                                print("Completed!");
                              },
                              pinTheme: PinTheme(
                                  borderRadius: BorderRadius.circular(5),
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
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Belum menerima email?"),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Kirim ulang kode",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blue,
                                        fontFamily: "Roboto",
                                        fontWeight: FontWeight.w700),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          width: 400,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(0),
                            elevation: 10,
                            onPressed: () {
                              formKey.currentState.validate();
                              if (currentText.length != 6) {
                                errorController.add(ErrorAnimationType.shake);
                                setState(() {
                                  hasError = true;
                                });
                              } else if (currentText.length == 6) {
                                BlocProvider.of<VerifyOTPBloc>(context).add(
                                    VerifyOTPEvent(
                                        otp: pinController.text, email: email));
                                setState(() {
                                  hasError = false;
                                  scaffoldKey.currentState.showSnackBar(
                                      SnackBar(duration: Duration(seconds: 2), content: Text("Success"),));
                                });
                              } else {
                                print("tes");
                              }
                            },
                            color: Colors.blue,
                            child: Container(
                              child: Ink(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFF358BFC),
                                      Color(0xFF3AE3CE)
                                    ])),
                                child: Container(
                                  constraints: BoxConstraints(
                                      maxWidth: 400, minHeight: 50),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Verifikasi",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontFamily: "Montserrat"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(20),
                          child: BlocConsumer<VerifyOTPBloc, BaseState>(
                            listener: (context, state) {
                              if (state is SuccesState) {
                                WidgetsBinding.instance
                                    .addPostFrameCallback((_) {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ConfirmPassPage(
                                      email: email,
                                      otp: pinController.text,
                                    );
                                  }));
                                  return Container();
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is EmptyState) {
                                return Text("OTP Belum diisi");
                              } else if (state is ErrorState) {
                                return Text(
                                  (state).message,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w900),
                                );
                              } else if (state is LoadingState) {
                                return CircularProgressIndicator();
                              } else {
                                return Container();
                              }
                            },
                          ),
                        )
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
