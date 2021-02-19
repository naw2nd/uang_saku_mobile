import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileEditComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          // Container(
          //   margin: EdgeInsets.only(bottom: 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         "Edit Profile",
          //         style: GoogleFonts.montserrat(
          //           fontSize: 14,
          //           color: Color(0xFF555555),
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       Text(
          //         "Change Password",
          //         style: GoogleFonts.montserrat(
          //           fontSize: 14,
          //           color: Color(0xFF358BFC),
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: TextEditingController(text: "Casey Affleck"),
                decoration: InputDecoration(
                    labelText: "Name",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller: TextEditingController(text: "mail.affleck.com"),
                decoration: InputDecoration(
                    labelText: "Email",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 15,
                  child: TextField(
                      controller: TextEditingController(text: "Jakarta"),
                      decoration: InputDecoration(
                          labelText: "Tempat lahir",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)))),
                ),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                  flex: 15,
                  child: TextField(
                      controller:
                          TextEditingController(text: "mail.affleck.com"),
                      decoration: InputDecoration(
                          labelText: "Tanggal lahir",
                          isDense: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                      onTap: () {
                        showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1945),
                            lastDate: DateTime.now(),
                            builder: (BuildContext context, Widget picker) {
                              return Theme(
                                //TODO: change colors
                                data: ThemeData.light(),
                                child: picker,
                              );
                            });
                      }),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: TextField(
                controller:
                    TextEditingController(text: "Onigashima, Wano Kuni"),
                decoration: InputDecoration(
                    labelText: "Alamat",
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)))),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                    flex: 15,
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        elevation: 0.0,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Color(0xFF555555)),
                            ),
                          ),
                        ),
                      ),
                    )),
                Flexible(
                  flex: 1,
                  child: Container(),
                ),
                Flexible(
                    flex: 15,
                    child: Container(
                      height: 40.0,
                      child: RaisedButton(
                        elevation: 0.0,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(0.0),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(10)),
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Save",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
