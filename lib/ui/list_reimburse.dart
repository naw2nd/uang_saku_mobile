import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/main_dashboard_widgets.dart';

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
            Flexible(
              flex: 1,
              child: Container(
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
              ),
            )
          ],
        ),
      )),
    );
  }
}
