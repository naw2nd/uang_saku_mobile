import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/reset_pass_event.dart';
import 'package:uang_saku/bloc/reset_pass_bloc.dart';
import 'package:uang_saku/ui/login_page.dart';

class ConfirmPassPage extends StatefulWidget {
  final String email;
  final String otp;
  @override
  _ConfirmPassPageState createState() =>
      _ConfirmPassPageState(email: email, otp: otp);

  ConfirmPassPage({this.otp, this.email});
}

class _ConfirmPassPageState extends State<ConfirmPassPage> {
  TextEditingController newPass = TextEditingController();
  TextEditingController fixpass = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool value = false;
  bool _showPassNew = true;
  bool _showPassFix = true;
  String email;
  String otp;

  _ConfirmPassPageState({this.email, this.otp});

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
              child: Text("Reset Password",
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontFamily: "montserrat",
                    fontWeight: FontWeight.w900,
                  )),
            ),
          ),
        ),
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
                        image: AssetImage('images/resetpass.png'),
                        width: 300,
                        height: 300,
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: TextField(
                            controller: newPass,
                            obscureText: _showPassNew,
                            decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: Icon(_showPassNew
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    _isPassNewVisibility();
                                  },
                                ),
                                labelText: "Password Baru",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      Container(
                        height: 70,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                        child: TextField(
                            controller: fixpass,
                            obscureText: _showPassFix,
                            decoration: InputDecoration(
                                suffix: IconButton(
                                  icon: Icon(_showPassFix
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    _isPassFixVisibility();
                                  },
                                ),
                                labelText: "Konfirmasi Password",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
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
                            if (newPass.text == fixpass.text) {
                              BlocProvider.of<ResetPassBloc>(context).add(
                                  ResetPassEvent(
                                      password: newPass.text,
                                      email: email,
                                      otp: otp));
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
                                  "Konfirmasi",
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
                        child: BlocConsumer<ResetPassBloc, BaseState>(
                          listener: (context, state) {
                            if (state is SuccesState) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return LoginPage();
                                }));
                                return Container();
                              });
                            }
                          },
                          builder: (context, state) {
                            if (state is EmptyState) {
                              return Text("Password belum diisi");
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
        ),
      ),
    );
  }

  void _isPassNewVisibility() {
    setState(() {
      _showPassNew = !_showPassNew;
    });
  }

  void _isPassFixVisibility() {
    setState(() {
      _showPassFix = !_showPassFix;
    });
  }
}
