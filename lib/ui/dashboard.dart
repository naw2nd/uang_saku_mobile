import 'package:flutter/material.dart';
import 'package:uang_saku/ui/list_approval.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:uang_saku/ui/list_reimburse.dart';
import 'package:uang_saku/ui/widgets/kasbon_card.dart';
import 'package:uang_saku/ui/widgets/reimburse_card.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _hasbeenPressed = true;
  bool _textHasBeenPressed = true;
  bool _laporanBackground = true;
  bool _laporanText = true;
  bool _kasbonBackground = true;
  bool _kasbonText = true;

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
                child: ListView(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 20),
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
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ListKasbon();
                                  }));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF358BFC),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                          "images/kasbon.png",
                                        )),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                            ),
                            Flexible(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return ListReimburse();
                                  }));
                                },
                                child: Container(
                                    padding: EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                        color: Color(0xFF3AE3CE),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Column(
                                      children: <Widget>[
                                        Image(
                                            image: AssetImage(
                                                "images/reimburse.png")),
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                              ),
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
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ListApproval();
                            }));
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              height: MediaQuery.of(context).size.height * 0.20,
                              decoration: BoxDecoration(
                                  color: Color(0xFF2B4D66),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Text("20",
                                          style: TextStyle(
                                              color: Color(0xFFE1F9F2),
                                              fontSize: 75,
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w700)),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(5, 20, 0, 0),
                                        child: Image(
                                            image: AssetImage(
                                                "images/jumlah_approval.png")),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(80, 10, 10, 10),
                                        child: Image(
                                          image:
                                              AssetImage("images/avatar.png"),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Text(
                                            "Pengajuan menunggu disetujui oleh :",
                                            style: TextStyle(
                                                color: Color(0xFFE1F9F2),
                                                fontSize: 14,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.clip),
                                      ),
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 0, 0),
                                        child: Text("Supervisor",
                                            style: TextStyle(
                                                color: Color(0xFFE1F9F2),
                                                fontSize: 20,
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.left,
                                            overflow: TextOverflow.clip),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                          child: Text(
                            "Progres Pengajuan",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.20,
                            decoration: BoxDecoration(
                                color: Color(0xFFF6F6F6),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: _hasbeenPressed
                                              ? Colors.white
                                              : Color(0xFF358BFC),
                                          onPressed: () {
                                            setState(() {
                                              _hasbeenPressed =
                                                  !_hasbeenPressed;
                                              _textHasBeenPressed =
                                                  !_textHasBeenPressed;
                                            });
                                            // Color(0xFF358BFC);
                                          },
                                          child: Text(
                                            "Kasbon",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
                                                color: _textHasBeenPressed
                                                    ? Color(0xFF9E9E9E)
                                                    : Colors.white),
                                          ),
                                        ),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: _laporanBackground
                                              ? Colors.white
                                              : Color(0xFF358BFC),
                                          onPressed: () {
                                            setState(() {
                                              _laporanBackground =
                                                  !_laporanBackground;
                                              _laporanText = !_laporanText;
                                            });
                                            // Color(0xFF358BFC);
                                          },
                                          child: Text(
                                            "Laporan",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
                                                color: _laporanText
                                                    ? Color(0xFF9E9E9E)
                                                    : Colors.white),
                                          ),
                                        ),
                                        RaisedButton(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: _kasbonBackground
                                              ? Colors.white
                                              : Color(0xFF358BFC),
                                          onPressed: () {
                                            setState(() {
                                              _kasbonBackground =
                                                  !_kasbonBackground;
                                              _kasbonText = !_kasbonText;
                                            });
                                            // Color(0xFF358BFC);
                                          },
                                          child: Text(
                                            "Reimburse",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w700,
                                                color: _kasbonText
                                                    ? Color(0xFF9E9E9E)
                                                    : Colors.white),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Container(
                                                  color: Colors.white,
                                                  width: 50,
                                                  height: 50,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .arrow_right_alt_rounded,
                                                        size: 35,
                                                        color: Colors.green,
                                                      ),
                                                      onPressed: () {})),
                                            ),
                                            Text("Diajukan",
                                                style: TextStyle(
                                                  color: Color(0xFF2B4D66),
                                                  fontFamily: "Montserrat",
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Container(
                                                  color: Colors.white,
                                                  width: 50,
                                                  height: 50,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.check_rounded,
                                                        size: 35,
                                                        color: Colors.blue,
                                                      ),
                                                      onPressed: () {})),
                                            ),
                                            Text("Disetujui",
                                                style: TextStyle(
                                                  color: Color(0xFF2B4D66),
                                                  fontFamily: "Montserrat",
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Container(
                                                  color: Colors.white,
                                                  width: 50,
                                                  height: 50,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons.cancel_outlined,
                                                        size: 35,
                                                        color: Colors.red,
                                                      ),
                                                      onPressed: () {})),
                                            ),
                                            Text("Ditolak",
                                                style: TextStyle(
                                                  color: Color(0xFF2B4D66),
                                                  fontFamily: "Montserrat",
                                                ))
                                          ],
                                        ),
                                        Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Container(
                                                  color: Colors.white,
                                                  width: 50,
                                                  height: 50,
                                                  child: IconButton(
                                                      icon: Icon(
                                                        Icons
                                                            .attach_money_rounded,
                                                        size: 35,
                                                        color: Colors.orange,
                                                      ),
                                                      onPressed: () {})),
                                            ),
                                            Text("Dicairkan",
                                                style: TextStyle(
                                                  color: Color(0xFF2B4D66),
                                                  fontFamily: "Montserrat",
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                              child: Text(
                                "Aktivitas Terakhir",
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
                                  child: Text("Lihat semua",
                                      style: TextStyle(
                                          color: Color(0xFFA8A8A8),
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12))),
                            )
                          ],
                        ),
                        KasbonCard(),
                        ReimburseCard()
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                        //   child: Card(
                        //     color: Colors.white,
                        //     elevation: 5,
                        //     child: Container(
                        //       padding: EdgeInsets.all(10),
                        //       child: Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Icon(Icons.file_present,
                        //               color: Colors.teal[400], size: 50),
                        //           Column(
                        //             crossAxisAlignment:
                        //                 CrossAxisAlignment.start,
                        //             children: <Widget>[
                        //               Text("Laporan kasbon selesai",
                        //                   style: TextStyle(
                        //                       fontFamily: "Montserrat",
                        //                       fontWeight: FontWeight.w600)),
                        //               Text("Perjalanan dengan client",
                        //                   style: TextStyle(
                        //                       fontFamily: "Montserrat",
                        //                       fontWeight: FontWeight.w600,
                        //                       color: Colors.grey[500],
                        //                       fontSize: 12))
                        //             ],
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
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
