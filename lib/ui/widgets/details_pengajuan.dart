import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DetailsPengajuan extends StatefulWidget {
  Color mainColor = Color(0xFF358BFC);
   String judul = "Detail Pengajuan Kasbon";

  DetailsPengajuan({this.mainColor,this.judul});

  @override
  _DetailsPengajuanState createState() => _DetailsPengajuanState(mainColor: mainColor,judul: judul);
}

class _DetailsPengajuanState extends State<DetailsPengajuan> {
  Color mainColor = Color(0xFF358BFC);
  String judul = "Detail Pengajuan Kasbon";

  _DetailsPengajuanState({this.mainColor,this.judul});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: mainColor,
          title: Text(judul,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Detail Pengajuan",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF555555)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Nomor Pengajuan",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("1/WG-RPBD/II/21",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600,
                            color: mainColor)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Tanggal Pengajuan",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("Senin,1 Februari 2021",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Nama Pegawai",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("I Gede Kresna",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Lokasi Tujuan",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("Jakarta",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Perusahaan",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("PT Wahana Meditek Indonesia",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Departemen, Cabang",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("IT, Surabaya",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text("Pelaksana",
                          style: TextStyle(
                            fontFamily: "Montserrat",
                          )),
                    ),
                    Text("I Gede Kresna",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Text("Aditya Indra",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text("Tanggal Mulai",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  Text("1 Februari 2021",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.red))
                                ],
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 2,
                              color: Color(0xFF2B4D66),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[
                                  Text("Tanggal Selesai",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      )),
                                  Text("3 Februari 2021",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.red))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Info Tambahan",
                          style: TextStyle(
                              fontFamily: "MOntserrat",
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "Perjalanan Dinas",
                          style: TextStyle(fontFamily: "Montserrat"),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Lokasi Tujuan",
                        style: TextStyle(fontFamily: "Montserrat"),
                      ),
                    ),
                    Text("New York, USA",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text("Agenda",
                            style: TextStyle(fontFamily: "Montserrat"))),
                    Text("Rapat dengan Warren Buffet terkait saham perusahaan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Detail Pengajuan Kasbon",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 15,
                            fontWeight: FontWeight.w600)),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.8,
                        animation: true,
                        lineHeight: 20.0,
                        animationDuration: 2000,
                        percent: 0.5,
                        center: Text(
                          "50.0%",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        linearStrokeCap: LinearStrokeCap.roundAll,
                        progressColor: mainColor,
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Approval Korcab",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Tidak ada catatan",
                                style: TextStyle(fontFamily: "Montserrat"),
                              )
                            ],
                          ),
                          Chip(
                              backgroundColor: mainColor,
                              label: Text(
                                "Selesai",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Approval Supervisor",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Oke lanjutkan",
                                style: TextStyle(fontFamily: "Montserrat"),
                              )
                            ],
                          ),
                          Chip(
                              backgroundColor: mainColor,
                              label: Text(
                                "Selesai",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Approval Keuangan",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Tidak ada catatan",
                                style: TextStyle(fontFamily: "Montserrat"),
                              )
                            ],
                          ),
                          Chip(
                              backgroundColor: Color(0xFF82A5BF),
                              label: Text(
                                "Menunggu",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Approval Direktur",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "-",
                                style: TextStyle(fontFamily: "Montserrat"),
                              )
                            ],
                          ),
                          Chip(
                              backgroundColor: Color(0xFF82A5BF),
                              label: Text(
                                "Menunggu",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Rincian Biaya"),
                        Chip(
                            backgroundColor: mainColor,
                            label: Text(
                              "Terima Cash",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ))
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Perawatan",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600)),
                                IconButton(
                                    icon: Icon(Icons.file_present),
                                    onPressed: () {})
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Sisir kucing extra smooth",
                                    maxLines: 3,
                                    style: TextStyle(fontFamily: "Montserrat")),
                                Text(
                                  "Rp 134.000,00",
                                  style: TextStyle(fontFamily: "Montserrat"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Total Biaya",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF555555)),
                        ),
                        Text(
                          "Rp 256.000,00",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF555555)),
                        ),
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Text(
                          "Catatan",
                          style: TextStyle(fontFamily: "Montserrat"),
                        )),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Text(
                          "Semua biaya digunakan untuk entertain Warren Buffett dan Elon Musk",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
