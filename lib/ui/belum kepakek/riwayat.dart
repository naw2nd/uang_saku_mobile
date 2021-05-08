import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:uang_saku/bloc/event/reimburse_event.dart';
import 'package:uang_saku/bloc/kasbon_bloc.dart';
import 'package:uang_saku/bloc/reimburse_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/list_kasbon_state.dart';
import 'package:uang_saku/bloc/state/list_reimburse_state.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/ui/details_pengajuan_kasbon.dart';
import '../details_pengajuan_reimburse.dart';
import 'card_list.dart';
import 'main_dashboard_widgets.dart';

class RiwayatPage extends StatefulWidget {
  @override
  _RiwayatPageState createState() => _RiwayatPageState();
}

class _RiwayatPageState extends State<RiwayatPage> {
  List<String> cardIcon = [
    "images/send-file-decline.png",
    "images/send-file-cyan.png",
    "images/send-file-money.png",
    "images/icon-done.png",
  ];

  @override
  void initState() {
    BlocProvider.of<KasbonBloc>(context).add(KasbonEvent());
    BlocProvider.of<ReimburseBloc>(context).add(ReimburseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: DashboardWidgets(
        backgroundColor: [Color(0xFF358BFC), Color(0xFF3AE3CE)],
        judul: "Riwayat",
        icon: Icons.filter_list,
        child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Column(
            children: <Widget>[
              Container(
                child: TabBar(
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.blue,
                  tabs: [
                    Tab(
                      child: Text(
                        "Kasbon",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Color(0xFF358BFC)),
                      ),
                    ),
                    Tab(
                        child: Text(
                      "Reimburse",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF3AE3CE)),
                    ))
                  ],
                ),
              ),
              Flexible(
                child: Container(
                  height: MediaQuery.of(context).size.height * 1,
                  child: TabBarView(
                    children: <Widget>[
                      BlocBuilder<KasbonBloc, BaseState>(
                          builder: (context, state) {
                        if (state is ListKasbonState) {
                          if (state.kasbon.isNotEmpty) {
                            List<Widget> list = [];
                            state.kasbon.forEach((element) {
                              element.statusApproval ==
                                      "Pengajuan Kasbon Selesai"
                                  ? list.add(Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 15),
                                      child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return DetailsPengajuanKasbon(
                                                id: element.idPengajuanKasbon);
                                          }))
                                            ..whenComplete(() => initState());
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
                                                          cardIcon[element
                                                              .statusPengajuan]),
                                                      width: 31,
                                                      height: 31,
                                                    )),
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
                                                                        .statusApproval,
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
                                                                element.tujuan,
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
                                                                      .format(element
                                                                          .tglPengajuan),
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
                                                                            locale:
                                                                                "eu",
                                                                            symbol:
                                                                                "")
                                                                        .format(
                                                                            element.nominalPencairan),
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
                                                            ],
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ]),
                                        )),
                                      )))
                                  : Text("Masih Kosong");
                            });
                            return Expanded(
                              child: ListView(
                                children: list,
                              ),
                            );
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
                      }),
                      Container(
                        child: BlocBuilder<ReimburseBloc, BaseState>(
                            builder: (context, state) {
                          if (state is ListReimburseState) {
                            if (state.reimburse.isNotEmpty) {
                              List<Widget> list = [];
                              state.reimburse.forEach((element) {
                                element.statusApproval == "Dana Sudah Dicairkan"
                                    ? list.add(Container(
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return DetailsPengajuanReimburse(
                                                  id: element
                                                      .idPengajuanReimburse);
                                            }))
                                              ..whenComplete(() => initState());
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
                                                            cardIcon[element
                                                                .statusPengajuan]),
                                                        width: 31,
                                                        height: 31,
                                                      )),
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
                                                                    margin: EdgeInsets.only(
                                                                        bottom:
                                                                            5),
                                                                    child: Text(
                                                                      element
                                                                          .statusApproval,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      style: GoogleFonts.roboto(
                                                                          fontWeight: FontWeight
                                                                              .w800,
                                                                          fontSize:
                                                                              14),
                                                                    )),
                                                                Text(
                                                                  element
                                                                      .tujuan,
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
                                                              ],
                                                            )),
                                                      ],
                                                    ),
                                                  )
                                                ]),
                                          )),
                                        )))
                                    : Text("Masih kosong ");
                              });
                              return Expanded(
                                child: ListView(
                                  children: list,
                                ),
                              );
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
                        }),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
