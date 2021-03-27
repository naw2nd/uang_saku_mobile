import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/component/profile_component.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/ui/detail_rincian_approval.dart';

class DetailsPengajuan extends StatefulWidget {
  @override
  _DetailsPengajuanState createState() => _DetailsPengajuanState();
}

class _DetailsPengajuanState extends State<DetailsPengajuan> {
  Color mainColor = Color(0xFF358BFC);
  String judul = "Detail Pengajuan Kasbon";

  @override
  void initState() {
    print("init event");
    context.read<KasbonBloc>().add(KasbonEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print(list.);
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
        body: BlocBuilder<KasbonBloc, BaseState>(
          builder: (_, state) {
            if (state is KasbonState) {
              // String percent = state.kasbon.approval.approved.toString();
              // String barApproved() {
              //   if (percent == null) {
              //     Padding(
              //       padding: EdgeInsets.all(10),
              //       child: LinearPercentIndicator(
              //         width: MediaQuery.of(context).size.width * 0.8,
              //         animation: true,
              //         lineHeight: 20.0,
              //         animationDuration: 2000,
              //         percent: 0.0,
              //         center: Text(
              //           "0.0%",
              //           style: TextStyle(
              //               fontFamily: "Montserrat",
              //               fontWeight: FontWeight.w600,
              //               color: Colors.white),
              //         ),
              //         linearStrokeCap: LinearStrokeCap.roundAll,
              //         progressColor: mainColor,
              //       ),
              //     );
              //   } else {
              //     Text("hehe");
              //   }
              // }

              return ListView(
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
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Nomor Pengajuan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Text(state.kasbon.nomorPengajuan,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF555555))),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Tanggal Pengajuan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Text(
                              DateFormat.yMMMMd('en_US')
                                  .format(state.kasbon.tglMulai),
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
                          Text(state.kasbon.pegawai.namaPegawai,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600)),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text("Tujuan",
                                style: TextStyle(
                                  fontFamily: "Montserrat",
                                )),
                          ),
                          Text(state.kasbon.tujuan,
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
                          Text(
                              state.kasbon.perusahaan.namaPerusahaan.toString(),
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
                          Text(
                              state.kasbon.department.namaDepartment
                                      .toString() +
                                  "," +
                                  state.kasbon.cabang.namaCabang.toString(),
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
                          Text(state.kasbon.pelaksana.toString(),
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600)),
                          Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                            child: IntrinsicHeight(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text("Tanggal Mulai",
                                            style: TextStyle(
                                              fontFamily: "Montserrat",
                                            )),
                                        Text(
                                            DateFormat.yMMMMd('en_US')
                                                .format(state.kasbon.tglMulai)
                                                .toString(),
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
                                        Text(
                                            DateFormat.yMMMMd('en_US')
                                                .format(state.kasbon.tglSelesai)
                                                .toString(),
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
                          Text(
                              "Rapat dengan Warren Buffet terkait saham perusahaan",
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
                          //barApproved(),
                          // Padding(
                          //   padding: EdgeInsets.all(10),
                          //   child: LinearPercentIndicator(
                          //     width: MediaQuery.of(context).size.width * 0.8,
                          //     animation: true,
                          //     lineHeight: 20.0,
                          //     animationDuration: 2000,
                          //     percent: 0.5,
                          //     center: Text(
                          //       "50.0%",
                          //       style: TextStyle(
                          //           fontFamily: "Montserrat",
                          //           fontWeight: FontWeight.w600,
                          //           color: Colors.white),
                          //     ),
                          //     linearStrokeCap: LinearStrokeCap.roundAll,
                          //     progressColor: mainColor,
                          //   ),
                          // ),
                          Container(
                              // child: Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: <Widget>[
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: <Widget>[
                              //         Text(
                              //           "Approval Korcab",
                              //           style: TextStyle(
                              //               fontFamily: "Montserrat",
                              //               fontWeight: FontWeight.w600),
                              //         ),
                              //         Text(
                              //           "Tidak ada catatan",
                              //           style:
                              //               TextStyle(fontFamily: "Montserrat"),
                              //         )
                              //       ],
                              //     ),
                              //     Chip(
                              //         backgroundColor: mainColor,
                              //         label: Text(
                              //           "Selesai",
                              //           style: TextStyle(
                              //               fontFamily: "Montserrat",
                              //               fontWeight: FontWeight.w600,
                              //               color: Colors.white),
                              //         ))
                              //   ],
                              // ),
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
                                      style:
                                          TextStyle(fontFamily: "Montserrat"),
                                    )
                                  ],
                                ),
                                state.kasbon.approval.approved == 2
                                    ? Chip(
                                        backgroundColor: mainColor,
                                        label: Text(
                                          "Selesai",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ))
                                    : Chip(
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
                                      "Approval Keuangan",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      "Tidak ada catatan",
                                      style:
                                          TextStyle(fontFamily: "Montserrat"),
                                    )
                                  ],
                                ),
                                state.kasbon.approval.approved == 3 &&
                                        state.kasbon.approval.approved == 2
                                    ? Chip(
                                        backgroundColor: mainColor,
                                        label: Text(
                                          "Selesai",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ))
                                    : Chip(
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
                                      style:
                                          TextStyle(fontFamily: "Montserrat"),
                                    )
                                  ],
                                ),
                                state.kasbon.approval.approved == 4 &&
                                        state.kasbon.approval.approved == 3 &&
                                        state.kasbon.approval.approved == 2
                                    ? Chip(
                                        backgroundColor: mainColor,
                                        label: Text(
                                          "Selesai",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white),
                                        ))
                                    : Chip(
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
                                    state.kasbon.jenisPencairan,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white),
                                  ))
                            ],
                          ),
                          ListView.builder(
                            itemCount: state.kasbon.rincianPengajuan == null
                                ? 0
                                : state.kasbon.rincianPengajuan.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, i) {
                              final x = state.kasbon.rincianPengajuan[i];
                              return Container(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                                child: GestureDetector(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RincianApproval(
                                            judul: "Rincian Biaya Kasbon",
                                            namaHolder: x.namaItem,
                                            keteranganHolder: x.keterangan,
                                            jumlahHolder:
                                                x.jumlahUnit.toString(),
                                            hargaHolder:
                                                x.hargaSatuan.toString(),
                                            kategoriHolder: x.kategoriBiaya
                                                .namaKategoriBiaya,
                                            totalHolder: x.total.toString(),
                                          );
                                        });
                                  },
                                  child: Card(
                                    elevation: 3,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      child: Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              x.namaItem != null
                                                  ? Text(x.namaItem.toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w600))
                                                  : Text(""),
                                              IconButton(
                                                  icon:
                                                      Icon(Icons.file_present),
                                                  onPressed: () {})
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              x.keterangan != null
                                                  ? Text(x.keterangan,
                                                      maxLines: 3,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat"))
                                                  : Text(""),
                                              x.total != null
                                                  ? Text(
                                                      "Rp" +
                                                          " " +
                                                          x.total.toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat"),
                                                    )
                                                  : Text("")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
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
                                state.kasbon.nominalPencairan.toString(),
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
                            child: Text(state.kasbon.catatanPengajuan,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w600)),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              );
            } else {
              print(state.toString() + "kjesdjvk ");
              return Text("sbsjabf");
            }
          },
        ),
      ),
    );
  }
}
