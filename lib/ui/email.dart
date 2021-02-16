import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/forgot_password_event.dart';
import 'package:uang_saku/bloc/forgot_password_bloc.dart';

import 'package:uang_saku/ui/verification.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  final TextEditingController emailController = TextEditingController();

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
              child: Text("Send Email",
                  style: TextStyle(
                    color: Color(0xFF555555),
                    fontFamily: "montserrat",
                    fontWeight: FontWeight.w900,
                  )),
            ),
          ),
        ),
        body: ListView(
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
                        "Masukkan email anda",
                        textAlign: TextAlign.center,
                        style:
                            TextStyle(fontFamily: "Montserrat", fontSize: (20)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: TextField(
                          controller: emailController,
                          decoration: InputDecoration(
                              labelText: "Email",
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
                          BlocProvider.of<ForgotPasswordBloc>(context).add(
                              ForgotpasswordEvent(email: emailController.text));
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
                              constraints:
                                  BoxConstraints(maxWidth: 400, minHeight: 50),
                              alignment: Alignment.center,
                              child: Text(
                                "Kirim",
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
                      child: BlocConsumer<ForgotPasswordBloc, BaseState>(
                        listener: (context, state) {
                          if (state is SuccesState) {
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return VerificationPage(
                                    email: emailController.text);
                              }));
                            });
                            return Container();
                          }
                        },
                        builder: (context, state) {
                          if (state is EmptyState) {
                            return Text("Email Belum diisi");
                          } else if (state is ErrorState) {
                            return Text((state).message, style: TextStyle(
                                      color: Colors.red,
                                      fontFamily: "Montserrat",fontWeight: FontWeight.w900));
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
            )
          ],
        ),
      ),
    );
  }
}
