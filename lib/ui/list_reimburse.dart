import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
import 'package:uang_saku/ui/widgets/main_dashboard_widgets.dart';
import 'package:uang_saku/ui/widgets/reimburse_card.dart';

class ListReimburse extends StatefulWidget {
  @override
  _ListReimburseState createState() => _ListReimburseState();
}

class _ListReimburseState extends State<ListReimburse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: DashboardWidgets(
        iconback: Icons.arrow_back_rounded,
        backgroundColor: [Color(0xFF3AE3CE), Color(0xFF3AE3CE)],
        judul: "Reimburse",
        icon: Icons.filter_list,
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
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
            ReimburseCard(),
            //CardList()
          ],
        ),
      )),
    );
  }
}
