import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';

class RincianApproval extends StatefulWidget {
  File image;
  String judul = "Rincian Biaya kasbon";
  String namaHolder = "";
  String keteranganHolder = "";
  String jumlahHolder = "";
  String hargaHolder = "";
  String kategoriHolder = "";
  String totalHolder = "";
  RincianApproval(
      {this.image,
      this.judul,
      this.hargaHolder,
      this.jumlahHolder,
      this.kategoriHolder,
      this.keteranganHolder,
      this.namaHolder,
      this.totalHolder});
  @override
  _RincianApprovalState createState() => _RincianApprovalState(
      judul: judul,
      image: image,
      namaHolder: namaHolder,
      keteranganHolder: keteranganHolder,
      jumlahHolder: jumlahHolder,
      hargaHolder: hargaHolder,
      kategoriHolder: kategoriHolder,
      totalHolder: totalHolder);
}

class _RincianApprovalState extends State<RincianApproval> {
  File image;
  String judul = "Rincian Biaya kasbon";
  String namaHolder = "";
  String keteranganHolder = "";
  String jumlahHolder = "";
  String hargaHolder = "";
  String kategoriHolder = "";
  String totalHolder = "";

  _RincianApprovalState(
      {this.image,
      this.judul,
      this.hargaHolder,
      this.jumlahHolder,
      this.kategoriHolder,
      this.keteranganHolder,
      this.namaHolder,
      this.totalHolder});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Dialog(
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
                child: namaHolder != null
                    ? KeteranganRincian(keterangan: namaHolder)
                    : Text("")),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: TitleRincian(
                  title: "Kategori Biaya",
                )),
            Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: kategoriHolder != null
                    ? KeteranganRincian(
                        keterangan: kategoriHolder,
                      )
                    : Text("")),
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
                              keterangan: jumlahHolder != null
                                  ? jumlahHolder
                                  : Text(""))),
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
                            keterangan:
                                hargaHolder != null ? hargaHolder : Text(""),
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
                  child: totalHolder != null
                      ? Text(
                          totalHolder,
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Color(0xFF555555)),
                        )
                      : Text(""),
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
                child: keteranganHolder != null
                    ? KeteranganRincian(keterangan: keteranganHolder)
                    : Text("")),
          ],
        ),
      )
          // body: BlocBuilder<KasbonBloc, BaseState>(
          //   builder: (_, state) {
          //     if (state is KasbonState) {
          //       return ListView.builder(
          //           shrinkWrap: true,
          //           physics: ClampingScrollPhysics(),
          //           itemCount: state.kasbon.rincianPengajuan.length,
          //           itemBuilder: (context, i) {
          //             final x = state.kasbon.rincianPengajuan[i];
          //             ListView(
          //               children: <Widget>[
          //                 Dialog(
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: <Widget>[
          //                       Center(
          //                         child: Row(
          //                           mainAxisAlignment:
          //                               MainAxisAlignment.spaceAround,
          //                           children: <Widget>[
          //                             Padding(
          //                               padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
          //                               child: Text(
          //                                 judul,
          //                                 style: TextStyle(
          //                                     fontFamily: "Montserrat",
          //                                     fontWeight: FontWeight.w600,
          //                                     fontSize: 16,
          //                                     color: Color(0xFF555555)),
          //                               ),
          //                             ),
          //                             IconButton(
          //                                 icon: Icon(Icons.cancel,
          //                                     color: Color(0xFF555555)),
          //                                 onPressed: () {
          //                                   Navigator.pop(context);
          //                                 })
          //                           ],
          //                         ),
          //                       ),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: TitleRincian(
          //                             title: "Nama Biaya",
          //                           )),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: x.namaItem != null
          //                               ? KeteranganRincian(
          //                                   keterangan: x.namaItem)
          //                               : Text("")),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: TitleRincian(
          //                             title: "Kategori Biaya",
          //                           )),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: x.kategoriBiaya != null
          //                               ? KeteranganRincian(
          //                                   keterangan:
          //                                       x.kategoriBiaya.toString(),
          //                                 )
          //                               : Text("")),
          //                       Row(
          //                         children: <Widget>[
          //                           Flexible(
          //                             child: Column(
          //                               children: <Widget>[
          //                                 Container(
          //                                     padding: EdgeInsets.fromLTRB(
          //                                         20, 0, 20, 10),
          //                                     child: TitleRincian(
          //                                       title: "Jumlah",
          //                                     )),
          //                                 Container(
          //                                     padding: EdgeInsets.fromLTRB(
          //                                         20, 0, 20, 10),
          //                                     child: KeteranganRincian(
          //                                         keterangan: x.jumlahUnit != null
          //                                             ? x.jumlahUnit.toString()
          //                                             : Text(""))),
          //                               ],
          //                             ),
          //                           ),
          //                           Flexible(
          //                             child: Column(
          //                               children: <Widget>[
          //                                 Container(
          //                                     padding: EdgeInsets.fromLTRB(
          //                                         20, 0, 20, 10),
          //                                     child: TitleRincian(
          //                                       title: "Harga Satuan",
          //                                     )),
          //                                 Container(
          //                                     padding: EdgeInsets.fromLTRB(
          //                                         20, 0, 0, 10),
          //                                     child: KeteranganRincian(
          //                                       keterangan: x.hargaSatuan != null
          //                                           ? x.hargaSatuan.toString()
          //                                           : Text(""),
          //                                     )),
          //                               ],
          //                             ),
          //                           )
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceAround,
          //                         children: <Widget>[
          //                           Flexible(
          //                             child: Padding(
          //                               padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          //                               child: ClipRRect(
          //                                 borderRadius: BorderRadius.circular(15),
          //                                 child: image == null
          //                                     ? Center(
          //                                         child: Text(
          //                                           "Tidak ada gambar",
          //                                           style: TextStyle(
          //                                             fontFamily: "Montserrat",
          //                                           ),
          //                                         ),
          //                                       )
          //                                     : Image.file(image),
          //                               ),
          //                             ),
          //                           ),
          //                           Flexible(
          //                             child: Padding(
          //                               padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          //                               child: ClipRRect(
          //                                 borderRadius: BorderRadius.circular(15),
          //                                 child: image == null
          //                                     ? Center(
          //                                         child: Text("Tidak ada gambar",
          //                                             style: TextStyle(
          //                                               fontFamily: "Montserrat",
          //                                             )),
          //                                       )
          //                                     : Image.file(image),
          //                               ),
          //                             ),
          //                           )
          //                         ],
          //                       ),
          //                       Row(
          //                         mainAxisAlignment:
          //                             MainAxisAlignment.spaceBetween,
          //                         children: <Widget>[
          //                           Container(
          //                             padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
          //                             child: Text(
          //                               "Total Biaya",
          //                               style: TextStyle(
          //                                   fontFamily: "Montserrat",
          //                                   fontWeight: FontWeight.w700,
          //                                   fontSize: 16,
          //                                   color: Color(0xFF555555)),
          //                             ),
          //                           ),
          //                           Container(
          //                             padding:
          //                                 EdgeInsets.fromLTRB(20, 10, 20, 10),
          //                             child: x.total != null
          //                                 ? Text(
          //                                     x.total.toString(),
          //                                     style: TextStyle(
          //                                         fontFamily: "Montserrat",
          //                                         fontWeight: FontWeight.w700,
          //                                         fontSize: 14,
          //                                         color: Color(0xFF555555)),
          //                                   )
          //                                 : Text(""),
          //                           ),
          //                         ],
          //                       ),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: TitleRincian(
          //                             title: "Catatan",
          //                           )),
          //                       Container(
          //                           padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
          //                           child: x.keterangan != null
          //                               ? KeteranganRincian(
          //                                   keterangan: x.keterangan,
          //                                 )
          //                               : Text("")),
          //                     ],
          //                   ),
          //                 ),
          //               ],
          //             );
          //           });
          //     }
          //   },
          // ),
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
