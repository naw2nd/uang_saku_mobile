import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:uang_saku/ui/login_page.dart';

class VerificationPage extends StatefulWidget {
  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
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
                      "Masukkan kode yang telah diterima melalui email anda",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: "Montserrat", fontSize: (20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: PinCodeTextField(
                        pinTheme: PinTheme(
                            borderRadius: BorderRadius.circular(5),
                            inactiveColor: Colors.grey,
                            shape: PinCodeFieldShape.box),
                        backgroundColor: Color(0xFAFAFA),
                        appContext: context,
                        length: 6,
                        onChanged: (value) {
                          print(value);
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
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
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
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
