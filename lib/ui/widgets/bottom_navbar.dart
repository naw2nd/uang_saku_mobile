// import 'dart:html';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uang_saku/ui/create_kasbon.dart';
import 'package:uang_saku/ui/create_reimburse.dart';
import 'package:uang_saku/ui/notifikasi.dart';
import 'package:uang_saku/ui/profile_page.dart';
import 'package:uang_saku/ui/riwayat.dart';

import '../dashboard.dart';

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _currentTab = 0;
  List<Widget> widgetOptions = [
    DashboardPage(),
    RiwayatPage(),
    ShowModal(),
    NotifikasiPage(),
    ProfilePage()
  ];

  void onItemTap(int index) {
    setState(() {
      _currentTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: widgetOptions.elementAt(_currentTab)),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentTab,
          onTap: onItemTap,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard_outlined,
                  color: Color(0xFF358BFC),
                  size: 25,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.history, color: Color(0xFF358BFC), size: 25),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outlined,
                    color: Color(0xFF3AE3CE), size: 60),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications,
                    color: Color(0xFF3AE3CE), size: 25),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded,
                    color: Color(0xFF3AE3CE), size: 25),
                label: "")
          ],
        ),
      ),
    );
  }
}

class ShowModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: 328,
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: Image(
                    image: AssetImage("images/create.gif"),
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Text("Buat Pengajuan",
                    style: TextStyle(
                        color: Colors.grey[700],
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        fontSize: 20)),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Text(
                  "Buat pengajuan sesuai keperluan yang anda butuhkan",
                  style: TextStyle(
                      color: Colors.grey[500],
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Color(0xFF358BFC),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CreateKasbon();
                          }));
                        },
                        child: Text("Kasbon",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900,
                                fontSize: 14))),
                    FlatButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        color: Color(0xFF3AE3CE),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CreateReimburse();
                          }));
                        },
                        child: Text("Reimburse",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w900,
                                fontSize: 14)))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
