import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uang_saku/ui/main_page.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';

class SplashScreen extends StatelessWidget {
  // String token;

  @override
  Widget build(BuildContext context) {
    Timer(
        Duration(seconds: 2),
        () => getToken().then((value) => (value == null)
            ? Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                return MainPage();
              }))
            : Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
                return BottomNavbar();
              }))));
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

Future<String> getToken() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  return sharedPreferences.getString("token");
}
