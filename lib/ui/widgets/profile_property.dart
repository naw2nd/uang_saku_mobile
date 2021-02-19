import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileProperty extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String value;

  ProfileProperty({this.iconData, this.label, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.only(right: 15),
              child: Icon(
                iconData,
                color: Color(0xFF555555),
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              label,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600, color: Color(0xFF555555)),
            ),
            Text(
              value,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400, color: Color(0xFF555555)),
            )
          ]),
        ],
      ),
    );
  }
}