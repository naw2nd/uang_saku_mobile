import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage("images/uangsaku.png"),
                      width: 150,
                      height: 50,
                    ),
                    Image(
                      image: AssetImage("images/icon_dashboard.png"),
                      width: 30,
                      height: 30,
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Text(
                        "Pengajuan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  color: Color(0xFF358BFC),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: <Widget>[
                                  Image(image: AssetImage("images/kasbon.png")),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "Kasbon",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                  color: Color(0xFF3AE3CE),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: <Widget>[
                                  Image(
                                      image:
                                          AssetImage("images/reimburse.png")),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    child: Text(
                                      "Reimburse",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w900,
                                          fontSize: 20),
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      child: Text(
                        "Approval",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text("20",
                                      style: TextStyle(
                                          color: Color(0xFFE1F9F2),
                                          fontSize: 75,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w700)),
                                          Image(image: AssetImage("images/jumlah_approval.png"))
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                    "Pengajuan menunggu disetujui oleh :",
                                    style: TextStyle(
                                        color: Color(0xFFE1F9F2),
                                        fontSize: 14,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w700),
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.clip),
                              )
                            ],
                          ),
                          padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          height: 150,
                          decoration: BoxDecoration(
                              color: Color(0xFF2B4D66),
                              borderRadius: BorderRadius.circular(15)),
                        ),
                      ),
                    )
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
