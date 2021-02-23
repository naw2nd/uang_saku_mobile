import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileChangePasswordComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password baru",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Konfirmasi password",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
        ],
      ),
    );
  }
}
