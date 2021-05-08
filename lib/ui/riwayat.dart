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
import 'details_pengajuan_reimburse.dart';

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
    initEvent();
    super.initState();
  }

  initEvent() {
    BlocProvider.of<KasbonBloc>(context).add(GetListKasbonEvent());
    BlocProvider.of<ReimburseBloc>(context).add(GetListReimburseEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          ),
          title: Text(
            "Riwayat",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 25),
          ),
          actions: [
            IconButton(icon: Icon(Icons.filter_list), onPressed: () {})
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
                      // dragStartBehavior: DragStartBehavior.down,
                      // labelStyle: GoogleFonts.montserrat(
                      //     fontWeight: FontWeight.w600, fontSize: 18),
                      tabs: [
                        Text(
                          "Kasbon",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF358BFC)),
                        ),
                        Text(
                          "Reimburse",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Color(0xFF3AE3CE)),
                        )
                      ],
                      // indicatorColor: Color(0xFF2B4D66),
                      indicatorWeight: 2,
                    )),
              )),
        ),
        body: Container(
          padding: EdgeInsets.fromLTRB(0, 7, 0, 7),
          child: TabBarView(
            children: [
              BlocBuilder<KasbonBloc, BaseState>(builder: (context, state) {
                if (state is ListKasbonState) {
                  if (state.kasbon.isNotEmpty) {
                    List<Widget> list = [];
                    state.kasbon.forEach((element) {
                      element.statusApproval == "Pengajuan Kasbon Selesai"
                          ? list.add(Container(
                              margin: EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return DetailsPengajuanKasbon(
                                        id: element.idPengajuanKasbon);
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
                                              image: AssetImage(cardIcon[
                                                  element.statusPengajuan]),
                                              width: 31,
                                              height: 31,
                                            )),
                                        Flexible(
                                          flex: 15,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                  flex: 10,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  bottom: 5),
                                                          child: Text(
                                                            element
                                                                .statusApproval,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: GoogleFonts
                                                                .roboto(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    fontSize:
                                                                        14),
                                                          )),
                                                      Text(
                                                        element.tujuan,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      )
                                                    ],
                                                  )),
                                              Flexible(
                                                  flex: 6,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 5),
                                                        child: Text(
                                                          DateFormat.yMMMd()
                                                              .format(element
                                                                  .tglPengajuan),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .montserrat(
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
                                                            NumberFormat
                                                                    .currency(
                                                                        locale:
                                                                            "eu",
                                                                        symbol:
                                                                            "")
                                                                .format(element
                                                                    .nominalPencairan),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontSize: 13,
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
                    if (list.isNotEmpty)
                      return Container(
                        child: ListView(
                          children: list,
                        ),
                      );
                    else
                      return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Riwayat Kasbon masih Kosong",
                            style: GoogleFonts.montserrat(),
                          ));
                  } else {
                    return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Riwayat Kasbon masih Kosong",
                          style: GoogleFonts.montserrat(),
                        ));
                  }
                } else
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
              }),
              BlocBuilder<ReimburseBloc, BaseState>(builder: (context, state) {
                if (state is ListReimburseState) {
                  if (state.reimburse.isNotEmpty) {
                    List<Widget> list = [];
                    state.reimburse.forEach((element) {
                      if (element.statusPencairan == 1)
                        list.add(Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsPengajuanReimburse(
                                      id: element.idPengajuanReimburse);
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
                                            image: AssetImage(cardIcon[
                                                element.statusPengajuan]),
                                            width: 31,
                                            height: 31,
                                          )),
                                      Flexible(
                                        flex: 15,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                flex: 10,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            bottom: 5),
                                                        child: Text(
                                                          element
                                                              .statusApproval,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: GoogleFonts
                                                              .roboto(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  fontSize: 14),
                                                        )),
                                                    Text(
                                                      element.tujuan,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    )
                                                  ],
                                                )),
                                            Flexible(
                                                flex: 6,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          bottom: 5),
                                                      child: Text(
                                                        DateFormat.yMMMd()
                                                            .format(element
                                                                .tglPengajuan),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: GoogleFonts
                                                            .montserrat(
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
                                                                  locale: "eu",
                                                                  symbol: "")
                                                              .format(element
                                                                  .nominalRealisasi),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              fontSize: 13,
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
                    if (list.isNotEmpty)
                      return Container(
                        child: ListView(
                          children: list,
                        ),
                      );
                    else
                      return Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Riwayat Reimburse masih Kosong",
                            style: GoogleFonts.montserrat(),
                          ));
                  } else {
                    return Container(
                        alignment: Alignment.center,
                        child: Text(
                          "Riwayat Reimburse masih Kosong",
                          style: GoogleFonts.montserrat(),
                        ));
                  }
                } else
                  return Container(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator());
              })
            ],
          ),
        ),
      ),
    ));
  }
}
