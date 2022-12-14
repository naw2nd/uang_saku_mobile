import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/laporan_bloc.dart';
import 'package:uang_saku/bloc/reimburse_bloc.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/details_approval_kasbon.dart';
import 'package:uang_saku/ui/details_approval_reimburse.dart';

import 'custom_widgets/custom_card.dart';
import 'package:intl/intl.dart';

class ListApproval extends StatefulWidget {
  final int idRoleApproval;
  final String namaRoleApproval;
  ListApproval({this.idRoleApproval, this.namaRoleApproval});
  @override
  _ListApprovalState createState() => _ListApprovalState();
}

class _ListApprovalState extends State<ListApproval> {
  @override
  void initState() {
    initEvent();
    super.initState();
  }

  initEvent() {
    BlocProvider.of<KasbonBloc>(context).add(GetApprovalPengajuanEvent(
        idRoleApproval: widget.idRoleApproval,
        bodyApproval: BodyGetApproval(status: "aktif", tipe: "pengajuan"),
        jenisPengajuan: "Kasbon"));
    BlocProvider.of<ReimburseBloc>(context).add(GetApprovalPengajuanEvent(
        idRoleApproval: widget.idRoleApproval,
        bodyApproval: BodyGetApproval(status: "aktif", tipe: "pengajuan"),
        jenisPengajuan: "Reimburse"));
    BlocProvider.of<LaporanBloc>(context).add(GetApprovalPengajuanEvent(
        idRoleApproval: widget.idRoleApproval,
        bodyApproval: BodyGetApproval(status: "aktif", tipe: "laporan"),
        jenisPengajuan: "Reimburse"));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF2B4D66),
              centerTitle: true,
              title: Text(
                "Approval " + widget.namaRoleApproval,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // return FilterApproval();
                          });
                    })
              ],
              bottom: PreferredSize(
                  preferredSize: Size(50, 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        color: Colors.white,
                        height: 50,
                        child: TabBar(
                          dragStartBehavior: DragStartBehavior.down,
                          labelStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 16),
                          tabs: [
                            Text("Kasbon"),
                            Text("Reimburse"),
                            Text("Laporan")
                          ],
                          indicatorColor: Color(0xFF2B4D66),
                          indicatorWeight: 2,
                          unselectedLabelColor: Color(0x772B4D66),
                          labelColor: Color(0xFF2B4D66),
                        )),
                  )),
            ),
            body: TabBarView(
                dragStartBehavior: DragStartBehavior.down,
                children: [
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Minggu ini",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xFF555555)),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Tandai sudah dibaca",
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xFFA8A8A8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12))),
                            ],
                          )),
                      BlocBuilder<KasbonBloc, BaseState>(builder: (_, state) {
                        if (state is ListApprovalPengajuanState) {
                          List<KategoriPengajuan> kategori =
                              state.listKategoriPengajuan;

                          if (state.listApprovalPengajuan.isNotEmpty) {
                            List<Widget> list = [];
                            state.listApprovalPengajuan.forEach((element) {
                              list.add(Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DetailsApprovalKasbon(
                                            id: element.idPengajuanKasbon,
                                            idRoleApproval:
                                                widget.idRoleApproval,
                                            jenisPengajuan: "Kasbon");
                                      }))
                                        ..whenComplete(() => initEvent());
                                    },
                                    child: CustomCard(
                                        container: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                flex: 2,
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/send-file-download.png"),
                                                    width: 31,
                                                    height: 31)),
                                            Flexible(
                                              flex: 15,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      flex: 10,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          5),
                                                              child: Text(
                                                                element.tujuan,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        14),
                                                              )),
                                                          Text(
                                                            kategori
                                                                .singleWhere((e) =>
                                                                    e.idKategoriPengajuan ==
                                                                    element
                                                                        .idKategoriPengajuan)
                                                                .namaKategoriPengajuan,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      )),
                                                  Flexible(
                                                      flex: 6,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Text(
                                                              DateFormat.yMMMd()
                                                                  .format(element
                                                                      .tglPengajuan),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xFF6f96b0)),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Rp" +
                                                                NumberFormat.currency(
                                                                        locale:
                                                                            "eu",
                                                                        symbol:
                                                                            "")
                                                                    .format(element
                                                                        .nominalPencairan),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xFF58b84b)),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            )
                                          ]),
                                    )),
                                  )));
                            });
                            return Expanded(child: ListView(children: list));
                          } else {
                            return Container(
                                padding: EdgeInsets.only(top: 200),
                                alignment: Alignment.center,
                                child: Text(
                                  "Approval yang menunggu disetujui masih Kosong",
                                  style: GoogleFonts.montserrat(),
                                ));
                          }
                        } else
                          return Container(
                              padding: EdgeInsets.only(top: 200),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator());
                      })
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Minggu ini",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xFF555555)),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Tandai sudah dibaca",
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xFFA8A8A8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12))),
                            ],
                          )),
                      BlocBuilder<ReimburseBloc, BaseState>(
                          builder: (_, state) {
                        if (state is ListApprovalPengajuanState) {
                          List<KategoriPengajuan> kategori =
                              state.listKategoriPengajuan;
                          if (state.listApprovalPengajuan.isNotEmpty) {
                            List<Widget> list = [];
                            state.listApprovalPengajuan.forEach((element) {
                              list.add(Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return DetailsApprovalReimburse(
                                              id: element.idPengajuanReimburse,
                                              idRoleApproval:
                                                  widget.idRoleApproval);
                                        }))
                                          ..whenComplete(() => initEvent());
                                      },
                                      child: CustomCard(
                                          container: Container(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                            Flexible(
                                                flex: 2,
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/send-file-download.png"),
                                                    width: 31,
                                                    height: 31)),
                                            Flexible(
                                                flex: 15,
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Flexible(
                                                          flex: 10,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    element
                                                                        .tujuan,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts.roboto(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w800,
                                                                        fontSize:
                                                                            14),
                                                                  )),
                                                              Text(
                                                                kategori
                                                                    .singleWhere((e) =>
                                                                        e.idKategoriPengajuan ==
                                                                        element
                                                                            .idKategoriPengajuan)
                                                                    .namaKategoriPengajuan,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              )
                                                            ],
                                                          )),
                                                      Flexible(
                                                          flex: 6,
                                                          child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Container(
                                                                  margin: EdgeInsets
                                                                      .only(
                                                                          bottom:
                                                                              5),
                                                                  child: Text(
                                                                    DateFormat
                                                                            .yMMMd()
                                                                        .format(
                                                                            element.tglPengajuan),
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: GoogleFonts.montserrat(
                                                                        fontSize:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        color: Color(
                                                                            0xFF6f96b0)),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "Rp" +
                                                                      NumberFormat.currency(
                                                                              locale: "eu",
                                                                              symbol: "")
                                                                          .format(element.nominalRealisasi),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: GoogleFonts.montserrat(
                                                                      fontSize:
                                                                          13,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Color(
                                                                          0xFF58b84b)),
                                                                )
                                                              ]))
                                                    ]))
                                          ]))))));
                            });
                            return Expanded(child: ListView(children: list));
                          } else {
                            return Container(
                                padding: EdgeInsets.only(top: 200),
                                alignment: Alignment.center,
                                child: Text(
                                    "Approval yang menunggu disetujui masih Kosong",
                                    style: GoogleFonts.montserrat()));
                          }
                        } else
                          return Container(
                              padding: EdgeInsets.only(top: 200),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator());
                      })
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Minggu ini",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Color(0xFF555555)),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text("Tandai sudah dibaca",
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xFFA8A8A8),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12))),
                            ],
                          )),
                      BlocBuilder<LaporanBloc, BaseState>(builder: (_, state) {
                        if (state is ListApprovalPengajuanState) {
                          List<KategoriPengajuan> kategori =
                              state.listKategoriPengajuan;

                          if (state.listApprovalPengajuan.isNotEmpty) {
                            List<Widget> list = [];
                            state.listApprovalPengajuan.forEach((element) {
                              list.add(Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return DetailsApprovalKasbon(
                                            id: element.idPengajuanKasbon,
                                            idRoleApproval:
                                                widget.idRoleApproval,
                                            jenisPengajuan: "Laporan");
                                      }))
                                        ..whenComplete(() => initEvent());
                                    },
                                    child: CustomCard(
                                        container: Container(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                flex: 2,
                                                child: Image(
                                                    image: AssetImage(
                                                        "images/send-file-download.png"),
                                                    width: 31,
                                                    height: 31)),
                                            Flexible(
                                              flex: 15,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                      flex: 10,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                              margin: EdgeInsets
                                                                  .only(
                                                                      bottom:
                                                                          5),
                                                              child: Text(
                                                                element.tujuan,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: GoogleFonts.roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        14),
                                                              )),
                                                          Text(
                                                            kategori
                                                                .singleWhere((e) =>
                                                                    e.idKategoriPengajuan ==
                                                                    element
                                                                        .idKategoriPengajuan)
                                                                .namaKategoriPengajuan,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )
                                                        ],
                                                      )),
                                                  Flexible(
                                                      flex: 6,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            margin:
                                                                EdgeInsets.only(
                                                                    bottom: 5),
                                                            child: Text(
                                                              DateFormat.yMMMd()
                                                                  .format(element
                                                                      .tglPengajuan),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: GoogleFonts.montserrat(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Color(
                                                                      0xFF6f96b0)),
                                                            ),
                                                          ),
                                                          Text(
                                                            "Rp" +
                                                                NumberFormat.currency(
                                                                        locale:
                                                                            "eu",
                                                                        symbol:
                                                                            "")
                                                                    .format(element
                                                                        .nominalPencairan),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                    fontSize:
                                                                        13,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    color: Color(
                                                                        0xFF58b84b)),
                                                          )
                                                        ],
                                                      )),
                                                ],
                                              ),
                                            )
                                          ]),
                                    )),
                                  )));
                            });
                            return Expanded(child: ListView(children: list));
                          } else {
                            return Container(
                                padding: EdgeInsets.only(top: 200),
                                alignment: Alignment.center,
                                child: Text(
                                  "Approval yang menunggu disetujui masih Kosong",
                                  style: GoogleFonts.montserrat(),
                                ));
                          }
                        } else
                          return Container(
                              padding: EdgeInsets.only(top: 200),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator());
                      })
                    ],
                  ),
                ]),
          )),
    );
  }
}
