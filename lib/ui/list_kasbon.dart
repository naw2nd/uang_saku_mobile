import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/filter_dialog.dart';
import 'package:uang_saku/ui/widgets/bottom_navbar.dart';
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
                            return FilterDialog(buttonSimpan: Color(0xFF358BFC),);
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
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
                      child: Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Icon(Icons.check_box_rounded,
                                  color: Colors.blue[800], size: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text("Kasbon disetujui korcab",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600)),
                                  Text("Perjalanan dengan client",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[500],
                                          fontSize: 12))
                                ],
                              ),
                              Text("Senin, 12 April",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 10,
                                      color: Colors.blue[800]))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text("Reimburse"),
              )
            ]),
          )),
    );
  }
}
