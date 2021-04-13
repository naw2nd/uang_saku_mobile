import 'package:flutter/material.dart';

import 'card_list.dart';
import 'main_dashboard_widgets.dart';

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: DashboardWidgets(
        backgroundColor: [Color(0xFF358BFC), Color(0xFF3AE3CE)],
        judul: "Riwayat",
        icon: Icons.filter_list,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue,
                  tabs: [
                    Tab(
                      child: Text(
                        "Kasbon",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF358BFC)),
                      ),
                    ),
                    Tab(
                        child: Text(
                      "Reimburse",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF3AE3CE)),
                    ))
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: Text("Kasbon"),
                      ),
                      Container(
                        child: Text("Reimburse"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        //child:
        //     ListView(
        //   children: <Widget>[
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: <Widget>[
        //         Container(
        //           padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
        //           child: Text(
        //             "Minggu ini",
        //             style: TextStyle(
        //                 fontFamily: "Montserrat",
        //                 fontWeight: FontWeight.w700,
        //                 fontSize: 18,
        //                 color: Color(0xFF555555)),
        //           ),
        //         ),
        //         Padding(
        //           padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
        //           child: TextButton(
        //               onPressed: () {},
        //               child: Text("Tandai sudah dibaca",
        //                   style: TextStyle(
        //                       color: Color(0xFFA8A8A8),
        //                       fontFamily: "Montserrat",
        //                       fontWeight: FontWeight.w600,
        //                       fontSize: 12))),
        //         )
        //       ],
        //     ),

        //     //KasbonCard(),
        //   ],
        // ),
      )),
    );
  }
}
