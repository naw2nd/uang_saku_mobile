import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/list_reimburse_bloc.dart';
import 'package:uang_saku/bloc/state/list_reimburse_state.dart';
import 'package:intl/intl.dart';
import 'custom_widgets/custom_card.dart';
import 'details_pengajuan_reimburse.dart';

class ListReimburse extends StatefulWidget {
  @override
  _ListReimburseState createState() => _ListReimburseState();
}

class _ListReimburseState extends State<ListReimburse> {
  @override
  void initState() {
    BlocProvider.of<ListReimburseBloc>(context).add(InitEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF3AE3CE),
              centerTitle: true,
              title: Text(
                "Reimburse",
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
                      // showDialog(
                      //     context: context,
                      //     builder: (BuildContext context) {
                      //       return FilterApproval();
                      //     });
                    })
              ],
              bottom: PreferredSize(
                preferredSize: Size(0, 15),
                child: Container(
                  height: 15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                ),
              ),
            ),
            body: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 7),
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
                BlocBuilder<ListReimburseBloc, BaseState>(
                    builder: (context, state) {
                  if (state is ListReimburseState) {
                    if (state.reimburse.isNotEmpty) {
                      List<Widget> list = [];
                      state.reimburse.forEach((element) {
                        list.add(Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DetailsPengajuanReimburse(
                                      id: element.idPengajuanReimburse);
                                }));
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
                                                "images/send-file-cyan.png"),
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
                                                          element.tujuan,
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
                                                      "id kategori = " +
                                                          element
                                                              .idKategoriPengajuan
                                                              .toString(),
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
                })
              ],
            )));
  }
}
