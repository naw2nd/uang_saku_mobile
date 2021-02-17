import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.white,
                  ),
                  onPressed: null)
            ],
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
            ),
            elevation: 0.0,
            title: Text("Profile",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                ))),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
            ),
            Wrap(
              children: [
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 180,
                  decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          topLeft: Radius.circular(100))),
                  padding: EdgeInsets.only(top: 160, left: 20, right: 20),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 320,
                    child: ListView(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(bottom: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Edit Profile",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: "Montserrat",
                                          color: Color(0xFF358BFC),
                                          fontWeight: FontWeight.w900,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                DescWidget(
                                    iconData: Icons.contacts,
                                    label: "Nama",
                                    value: "Casey Affleck"),
                                DescWidget(
                                    iconData: Icons.markunread,
                                    label: "Email",
                                    value: "mail@affleck.com"),
                                DescWidget(
                                    iconData: Icons.event,
                                    label: "Tempat, tanggal lahir",
                                    value: "Surabaya, 25 Februari 1998"),
                                DescWidget(
                                    iconData: Icons.place,
                                    label: "Alamat",
                                    value: "Rogue Town, East Blue"),
                                DescWidget(
                                    iconData: Icons.local_phone,
                                    label: "No telepon",
                                    value: "08209570353"),
                              ],
                            )),
                        Text(
                          "Perusahaan",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 24,
                              color: Color(0xFF555555)),
                          textAlign: TextAlign.center,
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 10, bottom: 20),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                DescWidget(
                                    iconData: Icons.business,
                                    label: "Wahana Meditek Indonesia, Surabaya",
                                    value: "Staff divisi HR"),
                                DescWidget(
                                    iconData: Icons.business,
                                    label: "Wahana Rizky Gumilang, Malang",
                                    value: "Staff divisi IT"),
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('images/avatar.png'))),
                  height: 196,
                  width: 196,
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                Text(
                  "Ben Affleck",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 26,
                      color: Color(0xFF555555)),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "mail@affleck.com",
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                      color: Color(0xFF555555)),
                  textAlign: TextAlign.center,
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}

class DescWidget extends StatelessWidget {
  final IconData iconData;
  final String label;
  final String value;

  DescWidget({this.iconData, this.label, this.value});

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
            Text(label,
                style: TextStyle(
                    fontFamily: "Roboto",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF555555))),
            Text(value,
                style:
                    TextStyle(fontFamily: "Roboto", color: Color(0xFF555555))),
          ]),
        ],
      ),
    );
  }
}
