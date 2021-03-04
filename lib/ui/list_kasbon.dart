import 'package:flutter/material.dart';
import 'package:uang_saku/ui/create_laporan.dart';
import 'package:uang_saku/ui/details_approval.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
import 'package:uang_saku/ui/widgets/filter_dialog.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';
import 'package:uang_saku/ui/widgets/kasbon_card.dart';
import 'package:uang_saku/ui/widgets/laporan_card.dart';
import 'package:uang_saku/ui/widgets/main_dashboard_widgets.dart';

class ListKasbon extends StatefulWidget {
  @override
  _ListKasbonState createState() => _ListKasbonState();
}

class _ListKasbonState extends State<ListKasbon> {
  FilterDialog filterDialog = new FilterDialog(
    buttonSimpan: Color(0xFF358BFC),
  );
  TabBar myTabBar = TabBar(
    labelStyle: TextStyle(
        fontFamily: "Montserrat", fontWeight: FontWeight.w600, fontSize: 18),
    tabs: <Widget>[Text("Kasbon"), Text("Laporan")],
    indicatorColor: Color(0xFF358BFC),
    labelColor: Colors.blue,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Kasbon",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FilterDialog(
                              buttonSimpan: Color(0xFF358BFC),
                            );
                          });
                    })
              ],
              bottom: PreferredSize(
                  preferredSize: Size(50, 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        color: Colors.white,
                        height: 50,
                        child: myTabBar),
                  )),
            ),
            body: TabBarView(children: <Widget>[
              Center(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          child: Text(
                            "Minggu ini",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Tandai sudah dibaca",
                                  style: TextStyle(
                                      color: Color(0xFFA8A8A8),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))),
                        )
                      ],
                    ),
                    KasbonCard(),
                    KasbonCard()
                  ],
                ),
              ),
              ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                        child: Text(
                          "Minggu ini",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Color(0xFF555555)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Tandai sudah dibaca",
                                style: TextStyle(
                                    color: Color(0xFFA8A8A8),
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12))),
                      )
                    ],
                  ),
                  LaporanCard(),
                  LaporanCard()
                ],
              ),
            ]),
          )),
    );
  }
}


