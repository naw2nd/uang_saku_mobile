import 'dart:io';

import 'package:flutter/material.dart';

class RincianApproval extends StatefulWidget {
  File image;
  String judul = "Rincian Biaya kasbon";
  RincianApproval({this.image, this.judul});
  @override
  _RincianApprovalState createState() => _RincianApprovalState(judul: judul,image: image);
}

class _RincianApprovalState extends State<RincianApproval> {
  File image;
  String judul = "Rincian Biaya kasbon";

  _RincianApprovalState({this.image,this.judul});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Dialog(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            judul,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.cancel, color: Color(0xFF555555)),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TitleRincian(
                        title: "Nama Biaya",
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: KeteranganRincian(
                        keterangan: "Sisir Kucing extra smooth",
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TitleRincian(
                        title: "Kategori Biaya",
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: KeteranganRincian(
                        keterangan: "Pemeliharaan",
                      )),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: TitleRincian(
                                  title: "Jumlah",
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: KeteranganRincian(
                                  keterangan: "9",
                                )),
                          ],
                        ),
                      ),
                      Flexible(
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                                child: TitleRincian(
                                  title: "Harga Satuan",
                                )),
                            Container(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
                                child: KeteranganRincian(
                                  keterangan: "Rp 16.000,00",
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: image == null
                                ? Center(
                                    child: Text(
                                      "Tidak ada gambar",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  )
                                : Image.file(image),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: image == null
                                ? Center(
                                    child: Text("Tidak ada gambar",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                        )),
                                  )
                                : Image.file(image),
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: Text(
                          "Total Biaya",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF555555)),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Rp 256.000,00",
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF555555)),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TitleRincian(
                        title: "Catatan",
                      )),
                  Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: KeteranganRincian(
                        keterangan:
                            "Semua biaya disisihkan untuk menyumbang ke anak yatim",
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleRincian extends StatelessWidget {
  String title = "Nama Biaya";
  TitleRincian({this.title});
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontFamily: "Montserrat"),
    );
  }
}

class KeteranganRincian extends StatelessWidget {
  String keterangan = "Sisir kucing";
  KeteranganRincian({this.keterangan});
  @override
  Widget build(BuildContext context) {
    return Text(
      keterangan,
      style: TextStyle(
        fontFamily: "Montserrat",
        fontWeight: FontWeight.w600,
      ),
    );
  }
}