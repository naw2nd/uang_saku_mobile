import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/ui/profile_page.dart';
import 'package:uang_saku/ui/create_pengajuan.dart';

import 'notifikasi.dart';
import 'belum kepakek/riwayat.dart';
import 'dashboard.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentTab = 0;
  List<Widget> widgetOptions = [
    DashboardPage(),
    RiwayatPage(),
    DashboardPage(),
    NotifikasiPage(),
    ProfilePage()
  ];

  void onItemTap(int index) {
    if (index == 4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProfilePage()));
    } else {
      setState(() {
        _currentTab = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: widgetOptions.elementAt(_currentTab)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDialog();
          },
          elevation: 0,
          child: Container(
            width: 69,
            height: 60,
            child: Icon(
              Icons.add,
              size: 30,
            ),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          onTap: onItemTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  (_currentTab == 0)
                      ? Icons.dashboard
                      : Icons.dashboard_outlined,
                  color: Color(0xFF358BFC),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  (_currentTab == 1)
                      ? Icons.watch_later
                      : Icons.access_time_outlined,
                  color: Color(0xFF358BFC),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outlined, color: Colors.white),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  (_currentTab == 3)
                      ? Icons.notifications
                      : Icons.notifications_outlined,
                  color: Color(0xFF3AE3CE),
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  (_currentTab == 4) ? Icons.person : Icons.person_outline,
                  color: Color(0xFF3AE3CE),
                ),
                label: "")
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierColor: Colors.black45,
        builder: (BuildContext context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: <Widget>[
                Stack(children: [
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image(
                        image: AssetImage("images/create.gif"),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    IconButton(
                        icon: Icon(Icons.close_rounded),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        })
                  ])
                ]),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text("Buat Pengajuan",
                      style: GoogleFonts.montserrat(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 20)),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 15),
                  child: Text(
                    "Buat pengajuan sesuai keperluan yang anda butuhkan",
                    style: GoogleFonts.montserrat(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w600,
                        fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
                Row(
                  children: [
                    Flexible(
                        flex: 15,
                        child: Container(
                          height: 35,
                          child: RaisedButton(
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CreatePengajuan(
                                    jenisPengajuan: "Kasbon");
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10))),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF358BFC),
                                      Color(0xFF3AE3CE)
                                    ],
                                    begin: Alignment(0, 0),
                                    end: Alignment(2, 0),
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(10))),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Kasbon",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Flexible(
                        flex: 15,
                        child: Container(
                          height: 35,
                          child: RaisedButton(
                            elevation: 0.0,
                            onPressed: () {
                              Navigator.of(context, rootNavigator: true).pop();
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CreatePengajuan(
                                    jenisPengajuan: "Reimburse");
                              }));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10))),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF358BFC),
                                      Color(0xFF3AE3CE)
                                    ],
                                    begin: Alignment(-2, 0),
                                    end: Alignment(0, 0),
                                  ),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(10))),
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Reimburse",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 15,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
