import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';
import 'package:uang_saku/ui/widgets/kasbon_card.dart';
import 'package:uang_saku/ui/widgets/main_dashboard_widgets.dart';

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
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
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
            // Container(
            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            //   child: Card(
            //     color: Colors.white,
            //     elevation: 5,
            //     child: Container(
            //       padding: EdgeInsets.all(10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Icon(Icons.file_present,
            //               color: Colors.blue[800], size: 50),
            //           Flexible(
            //             flex: 1,
            //             child: Container(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Text("Pengajuan kasbon dicairkan",
            //                       style: TextStyle(
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w600,
            //                           fontSize: 12)),
            //                   Text("Perjalanan dengan client",
            //                       style: TextStyle(
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w600,
            //                           color: Colors.grey[500],
            //                           fontSize: 12))
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Text("Senin, 12 April",
            //               style: TextStyle(
            //                   fontFamily: "Montserrat",
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 10,
            //                   color: Colors.blue[800]))
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Container(
            //   padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
            //   child: Card(
            //     color: Colors.white,
            //     elevation: 5,
            //     child: Container(
            //       padding: EdgeInsets.all(10),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: <Widget>[
            //           Icon(Icons.file_present,
            //               color: Color(0xFF3AE3CE), size: 50),
            //           Flexible(
            //             flex: 1,
            //             child: Container(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: <Widget>[
            //                   Text("Pengajuan reimburse selesai",
            //                       style: TextStyle(
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w600,
            //                           fontSize: 12)),
            //                   Text("Perjalanan dengan client",
            //                       style: TextStyle(
            //                           fontFamily: "Montserrat",
            //                           fontWeight: FontWeight.w600,
            //                           color: Colors.grey[500],
            //                           fontSize: 12))
            //                 ],
            //               ),
            //             ),
            //           ),
            //           Text("Senin, 12 April",
            //               style: TextStyle(
            //                   fontFamily: "Montserrat",
            //                   fontWeight: FontWeight.w600,
            //                   fontSize: 10,
            //                   color: Colors.blue[800]))
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      )),
    );
  }
}
