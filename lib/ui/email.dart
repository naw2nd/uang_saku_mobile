import 'package:flutter/material.dart';

import 'package:uang_saku/ui/verification.dart';

class EmailPage extends StatefulWidget {
  @override
  _EmailPageState createState() => _EmailPageState();
}

class _EmailPageState extends State<EmailPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                      width: MediaQuery.of(context).size.width * 0.78,
                      child: TextField(
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
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return VerificationPage();
                          }));
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
