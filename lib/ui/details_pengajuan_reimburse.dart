import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/bloc/event/reimburse_event.dart';
import 'package:uang_saku/bloc/reimburse_bloc.dart';
import 'package:uang_saku/bloc/state/list_reimburse_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/item_rincian.dart';
import 'package:uang_saku/ui/update_pengajuan_reimburse.dart';

class DetailsPengajuanReimburse extends StatefulWidget {
  final int id;
  DetailsPengajuanReimburse({this.id});

  @override
  _DetailsPengajuanReimburseState createState() =>
      _DetailsPengajuanReimburseState();
}

class _DetailsPengajuanReimburseState extends State<DetailsPengajuanReimburse> {
  @override
  void initState() {
    BlocProvider.of<ReimburseBloc>(context)
        .add(GetReimburseEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          backgroundColor: Color(0xFF3AE3CE),
          title: Text("Detail Pengajuan Reimburse",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  BlocProvider.of<ReimburseBloc>(context).add(InitEvent());
                  Navigator.pop(context);
                })
          ],
        ),
        body: BlocBuilder<ReimburseBloc, BaseState>(
          builder: (_, state) {
            if (state is ReimburseState) {
              List<Widget> listPelaksana = [];
              state.reimburse.pelaksana.forEach((element) {
                listPelaksana.add(Text("- " + element,
                    style: GoogleFonts.montserrat(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF555555))));
              });

              List<Widget> listApproval = [
                Text(
                  "Progress Approval",
                  style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF555555)),
                ),
              ];
              state.reimburse.approval.all.forEach((element) {
                listApproval.add(Container(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    state
                                        .reimburse.approval.keterangan[element],
                                    style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF555555))),
                                Text("Tidak ada catatan",
                                    style: GoogleFonts.montserrat())
                              ],
                            )),
                        Flexible(
                            flex: 4,
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                color: (state.reimburse.approval.approved
                                        .contains(element))
                                    ? Color(0xFF3AE3CE)
                                    : Color(0xFF555555),
                              ),
                              child: Text(
                                  (state.reimburse.approval.approved
                                          .contains(element))
                                      ? "Disetujui"
                                      : "Menunggu",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                            ))
                      ],
                    )));
              });
              List<Widget> listRincian = [];
              state.reimburse.rincianRealisasi.forEach((element) {
                listRincian.add(ItemRincian(
                  jenisPengajuan: "Reimburse",
                  rincianBiaya: element,
                  isGet: true,
                ));
              });
              return ListView(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: CustomCard(
                          container: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Detail Pengajuan",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF555555)),
                                    ),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                      child: Text("Nomor Pengajuan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(state.reimburse.nomorPengajuan,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF3AE3CE))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Tanggal Pengajuan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(
                                        DateFormat.yMMMMd('en_US').format(
                                            state.reimburse.tglPengajuan),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Nama Pegawai",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(state.reimburse.pegawai.namaPegawai,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Tujuan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(state.reimburse.tujuan,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Perusahaan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(
                                        state
                                            .reimburse.perusahaan.namaPerusahaan
                                            .toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Departemen, Cabang",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(
                                        state.reimburse.department
                                                .namaDepartment
                                                .toString() +
                                            ", " +
                                            state.reimburse.cabang.namaCabang
                                                .toString(),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Pelaksana",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: listPelaksana),
                                    Container(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 15, 0, 15),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Container(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    Text("Tanggal Mulai",
                                                        style: GoogleFonts
                                                            .montserrat()),
                                                    Text(
                                                        DateFormat.yMMMMd(
                                                                'en_US')
                                                            .format(state
                                                                .reimburse
                                                                .tglMulai)
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xfff06060)))
                                                  ])),
                                              Container(
                                                  height: 50,
                                                  width: 2,
                                                  color: Color(0xFF555555)),
                                              Container(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                    Text("Tanggal Selesai",
                                                        style: GoogleFonts
                                                            .montserrat()),
                                                    Text(
                                                        DateFormat.yMMMMd(
                                                                'en_US')
                                                            .format(state
                                                                .reimburse
                                                                .tglSelesai)
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                color: Color(
                                                                    0xfff06060)))
                                                  ]))
                                            ]))
                                  ])))),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: CustomCard(
                      container: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: listApproval,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: CustomCard(
                      container: Container(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Rincian Biaya",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF555555)),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Color(0xFF3AE3CE)),
                                    child: Text(
                                      (state.reimburse.jenisPencairan == "cash")
                                          ? "Terima Cash"
                                          : "Via Transfer",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white),
                                    ),
                                  ),
                                ]),
                            Container(
                                padding: EdgeInsets.only(top: 5, bottom: 10),
                                child: Column(children: listRincian)),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total Biaya",
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF555555)),
                                  ),
                                  Text(
                                    "Rp" +
                                        NumberFormat.currency(
                                                locale: "eu", symbol: "")
                                            .format(state
                                                .reimburse.nominalRealisasi),
                                    style: GoogleFonts.montserrat(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF555555)),
                                  ),
                                ]),
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              child: Text("Catatan",
                                  style: GoogleFonts.montserrat()),
                            ),
                            Text(
                                (state.reimburse.catatan != null)
                                    ? state.reimburse.catatan
                                    : "Tidak ada catatan",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                  ),
                  (state.reimburse.statusPengajuan == 0)
                      ? Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                          child: Container(
                              height: 45.0,
                              child: RaisedButton(
                                  elevation: 2,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      Reimburse reimburse;
                                      reimburse = convertImage(state.reimburse);
                                      print(reimburse.toJson());
                                      return UpdatePengajuanReimburse(
                                          pengajuan: reimburse);
                                    }));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF3AE3CE),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text("Update",
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 22,
                                                  color: Colors.white)))))))
                      : Container(height: 20)
                ],
              );
            } else {
              return Container(
                  padding: EdgeInsets.only(top: 200),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  Reimburse convertImage(Reimburse reimburse) {
    for (int i = 0; i < reimburse.rincianRealisasi.length; i++) {
      for (int j = 0; j < reimburse.rincianRealisasi[i].images.length; j++) {
        reimburse.rincianRealisasi[i].action = "update";
        if (reimburse.rincianRealisasi[i].images[j].action == null)
          imgUrltoFile(reimburse.rincianRealisasi[i].images[j].image).then(
              (value) => reimburse.rincianRealisasi[i].images[j].image = value);
        reimburse.rincianRealisasi[i].images[j].action = "update";
      }
    }
    return reimburse;
  }

  Future<String> imgUrltoFile(String img) async {
    final ByteData imageData =
        await NetworkAssetBundle(Uri.parse(img)).load("");
    final List<int> bytes = imageData.buffer.asUint8List();
    return base64Encode(bytes);
  }
}
