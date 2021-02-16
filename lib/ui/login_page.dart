import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/login_bloc.dart';
import 'package:uang_saku/ui/dashboard.dart';
import 'package:uang_saku/ui/email.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/models.dart';
import '../bloc/state/base_state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = true;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                        image: AssetImage('images/logo.png'),
                        width: 250,
                        height: 250,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                      ),
                      TextField(
                          controller: passwordController,
                          obscureText: _showPassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            suffixIcon: IconButton(
                              icon: Icon(_showPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                _isPasswordVisibility();
                              },
                            ),
                          )),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: value,
                                    onChanged: (bool e) {
                                      print(e);
                                      setState(() {
                                        value = e;
                                      });
                                    },
                                  ),
                                  Text(
                                    "Remember Me",
                                    style: TextStyle(fontFamily: "Montserrat"),
                                  )
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return EmailPage();
                                  }));
                                },
                                child: Text(
                                  "Lupa Password?",
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
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        width: 400,
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.all(0),
                          elevation: 10,
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              BlocProvider.of<LoginBloc>(context).add(
                                  LoginEvent(
                                      email: emailController.text,
                                      password: passwordController.text));
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
                                  "Login",
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
                        decoration: BoxDecoration(color: Color(0xFAFAFA)),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        child: BlocBuilder<LoginBloc, BaseState>(
                            builder: (context, state) {
                          if (state is EmptyState) {
                            return Text(
                              "Belum Login",
                              style: TextStyle(fontFamily: "Montserrat"),
                            );
                          } else if (state is ErrorState) {
                            return Text(
                              (state).message,
                              style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Montserrat",fontWeight: FontWeight.w900),
                            );
                          } else if (state is SuccesState<Token>) {
                            print("Success State");
                            _saveToken(state.data.token).then((value) =>
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DashboardPage();
                                })));
                            return Container();
                          } else if (state is LoadingState) {
                            return CircularProgressIndicator();
                          } else {
                            return Container();
                          }
                        }),
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

  _saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("token", token);
  }

  void _isPasswordVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
