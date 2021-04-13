import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/model/body_post_approval.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/item_rincian.dart';

import 'bottom_navbar.dart';

class DetailsApprovalKasbon extends StatefulWidget {
  final int id;
  final int idRoleApproval;
  DetailsApprovalKasbon({this.id, this.idRoleApproval});

  @override
  _DetailsApprovalKasbonState createState() => _DetailsApprovalKasbonState();
}

class _DetailsApprovalKasbonState extends State<DetailsApprovalKasbon> {
  @override
  void initState() {
    BlocProvider.of<KasbonBloc>(context).add(GetKasbonEvent(id: widget.id));
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
          backgroundColor: Color(0xFF2B4D66),
          title: Text("Detail Pengajuan Kasbon",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  BlocProvider.of<KasbonBloc>(context).add(InitEvent());
                  Navigator.pop(context);
                })
          ],
        ),
        body: BlocConsumer<KasbonBloc, BaseState>(
          listener: (context, state) {
            if (state is SuccesState<String>) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(state.data),
                duration: Duration(seconds: 1),
              ));
              Timer(
                  Duration(seconds: 2),
                  () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return BottomNavbar();
                      })));
              // Navigator.of(context, rootNavigator: true).pop(context));
            } else if (state is ErrorState) {
              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
              Timer(
                  Duration(seconds: 2),
                  () =>
                      Navigator.of(context, rootNavigator: true).pop(context));
            }
          },
          builder: (_, state) {
            if (state is KasbonState) {
              List<Widget> listPelaksana = [];
              state.kasbon.pelaksana.forEach((element) {
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
              state.kasbon.approval.all.forEach((element) {
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
                                Text(state.kasbon.approval.keterangan[element],
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
                                color: (state.kasbon.approval.approved
                                        .contains(element))
                                    ? Color(0xFF2B4D66)
                                    : Color(0xAA555555),
                              ),
                              child: Text(
                                  (state.kasbon.approval.approved
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
              state.kasbon.rincianPengajuan.forEach((element) {
                listRincian.add(ItemRincian(
                  jenisPengajuan: "Kasbon",
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
                                    Text(state.kasbon.nomorPengajuan,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF2B4D66))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Tanggal Pengajuan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(
                                        DateFormat.yMMMMd('en_US')
                                            .format(state.kasbon.tglPengajuan),
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Nama Pegawai",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(state.kasbon.pegawai.namaPegawai,
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xFF555555))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
                                      child: Text("Tujuan",
                                          style: GoogleFonts.montserrat()),
                                    ),
                                    Text(state.kasbon.tujuan,
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
                                        state.kasbon.perusahaan.namaPerusahaan
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
                                        state.kasbon.department.namaDepartment
                                                .toString() +
                                            ", " +
                                            state.kasbon.cabang.namaCabang
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
                                                            .format(state.kasbon
                                                                .tglMulai)
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                color:
                                                                    Colors.red))
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
                                                            .format(state.kasbon
                                                                .tglSelesai)
                                                            .toString(),
                                                        style: GoogleFonts
                                                            .montserrat(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 16,
                                                                color:
                                                                    Colors.red))
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
                                        color: Color(0xFF2B4D66)),
                                    child: Text(
                                      (state.kasbon.jenisPencairan == "cash")
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
                                            .format(
                                                state.kasbon.nominalPencairan),
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
                                (state.kasbon.catatanPengajuan != null)
                                    ? state.kasbon.catatanPengajuan
                                    : "Tidak ada catatan",
                                style: GoogleFonts.montserrat(
                                    fontSize: 15, fontWeight: FontWeight.w500))
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 15,
                            child: Container(
                              height: 40.0,
                              child: RaisedButton(
                                elevation: 2,
                                onPressed: () {
                                  BlocProvider.of<KasbonBloc>(context).add(
                                      PostApprovalKasbonEvent(
                                          idRoleApproval: widget.idRoleApproval,
                                          bodyApproval: BodyPostApproval(
                                              idPengajuanKasbon: widget.id,
                                              catatan: "nocat",
                                              status: "tolak",
                                              tipe: "pengajuan")));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Color(0xfff54949),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Tolak",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Flexible(
                          flex: 1,
                          child: Container(),
                        ),
                        Flexible(
                            flex: 15,
                            child: Container(
                              height: 40.0,
                              child: RaisedButton(
                                elevation: 2,
                                onPressed: () {
                                  BlocProvider.of<KasbonBloc>(context).add(
                                      PostApprovalKasbonEvent(
                                          idRoleApproval: widget.idRoleApproval,
                                          bodyApproval: BodyPostApproval(
                                              idPengajuanKasbon: widget.id,
                                              catatan: "nocat",
                                              status: "setuju",
                                              tipe: "pengajuan")));
                                },
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(0.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                      color: Color(0xFF2B4D66),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Setujui",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: <Widget>[
                  //     RaisedButton(
                  //       onPressed: () {
                  //         showDialog(
                  //             context: context,
                  //             builder: (BuildContext context) {
                  //               return AlertDialog(
                  //                 title: Text("Tinggalkan Catatan"),
                  //                 content: TextField(
                  //                   maxLines: 3,
                  //                   decoration: const InputDecoration(
                  //                     hintStyle:
                  //                         TextStyle(color: Colors.black45),
                  //                     errorStyle:
                  //                         TextStyle(color: Colors.redAccent),
                  //                     border: OutlineInputBorder(),
                  //                     labelText: 'Catatan',
                  //                   ),
                  //                   onTap: () {},
                  //                   //controller: tanggalSelesai,
                  //                 ),
                  //                 actions: <Widget>[
                  //                   FlatButton(
                  //                     child: Text("Cancel"),
                  //                     onPressed: () {
                  //                       Navigator.pop(context);
                  //                     },
                  //                   ),
                  //                   FlatButton(
                  //                     child: Text("Upload"),
                  //                     onPressed: () {
                  //                       showDialog(
                  //                           context: context,
                  //                           builder: (BuildContext context) {
                  //                             return AlertDialog(
                  //                               content: Text(
                  //                                   "Apakah anda yakin ingin membatalkan pengajaun ini?"),
                  //                               actions: <Widget>[
                  //                                 FlatButton(
                  //                                   child: Text("Tidak"),
                  //                                   onPressed: () {
                  //                                     Navigator.pop(context);
                  //                                   },
                  //                                 ),
                  //                                 FlatButton(
                  //                                   child: Text("Ya"),
                  //                                   onPressed: () {
                  //                                     // (state
                  //                                     //     is CancelKasbonState);
                  //                                     // context
                  //                                     //     .read<KasbonBloc>()
                  //                                     //     .add(
                  //                                     //         CancelKasbonEvent());
                  //                                     // return Navigator.push(
                  //                                     //     context,
                  //                                     //     MaterialPageRoute(
                  //                                     //         builder:
                  //                                     //             (context) {
                  //                                     //   return DetailsPengajuan();
                  //                                     // }));
                  //                                   },
                  //                                 )
                  //                               ],
                  //                             );
                  //                           });
                  //                     },
                  //                   )
                  //                 ],
                  //               );
                  //             });
                  //       },
                  //       child: Text(
                  //         "Batal",
                  //         style: GoogleFonts.montserrat(
                  //             color: Colors.white,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       color: Colors.red,
                  //     ),
                  //     RaisedButton(
                  //       onPressed: () {},
                  //       child: Text(
                  //         "Update",
                  //         style: GoogleFonts.montserrat(
                  //             color: Colors.white,
                  //             fontSize: 20,
                  //             fontWeight: FontWeight.w600),
                  //       ),
                  //       color: Colors.blue,
                  //     ),
                  //   ],
                  // )
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
}
