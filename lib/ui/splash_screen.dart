import 'dart:async';

import 'package:flutter/material.dart';
import 'package:uang_saku/ui/login_page.dart';
import 'package:uang_saku/ui/profile_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return LoginPage();
            })));
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Image(
          width: 250,
          height: 250,
          image: AssetImage('images/logo.png'),
        ),
      )),
    );
  }
}
