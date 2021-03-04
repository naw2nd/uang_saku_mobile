import 'package:flutter/material.dart';

class ConfirmPassPage extends StatefulWidget {
  @override
  _ConfirmPassPageState createState() => _ConfirmPassPageState();
}

class _ConfirmPassPageState extends State<ConfirmPassPage> {
  bool value = false;

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
        body: ListView(
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
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              suffix: Icon(Icons.remove_red_eye),
                              labelText: "Password Baru",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                      child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              suffix: Icon(Icons.remove_red_eye),
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
