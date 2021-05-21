import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/event/kasbon_event.dart';
import 'package:intl/intl.dart';
import 'package:uang_saku/bloc/event/laporan_event.dart';
import 'package:uang_saku/bloc/laporan_bloc.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/laporan.dart';
import 'package:uang_saku/ui/belum%20kepakek/form_rincian_laporan.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/form_rincian_biaya.dart';
import 'package:uang_saku/ui/custom_widgets/item_laporan.dart';
import 'package:uang_saku/ui/custom_widgets/item_rincian.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:uang_saku/ui/detail_rincian_approval.dart';
import 'package:uang_saku/ui/update_laporan.dart';

import 'update_pengajuan_kasbon.dart';

class DetailsPengajuanKasbon extends StatefulWidget {
  final int id;
  final String jenisPengajuan;
  DetailsPengajuanKasbon({this.id, this.jenisPengajuan});

  @override
  _DetailsPengajuanKasbonState createState() => _DetailsPengajuanKasbonState();
}

class _DetailsPengajuanKasbonState extends State<DetailsPengajuanKasbon> {
  List _listRincianBiaya = [];
  List<Widget> _listItemRincian = [];
  int _totalBiaya = 0;
  TextEditingController _catatanCtrl = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<CreateRincianBiayaBloc>(context).add(EmptyEvent());
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
          backgroundColor: Color(0xFF358BFC),
          title: Text("Detail Pengajuan " + widget.jenisPengajuan,
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
          listener: (_, state) {
            if (state is SuccesState<String>) {
              Navigator.pop(context);
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
                                    ? Color(0xFF358BFC)
                                    : Color(0xFF555555),
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
              //List Rincian Pengajuan
              List<Widget> listRincian = [];
              state.kasbon.rincianPengajuan.forEach((element) {
                listRincian.add(ItemRincian(
                  jenisPengajuan: "Kasbon",
                  rincianBiaya: element,
                  isGet: true,
                ));
              });
              List<Widget> listRincianRealisasi = [];
              state.kasbon.rincianRealisasi.forEach((element) {
                listRincianRealisasi.add(ItemRincian(
                  jenisPengajuan: "Laporan",
                  rincianBiaya: element,
                  isGet: true,
                ));
              });
              //List Rincian Laporan
              List<Widget> listLaporan = [];
              state.kasbon.rincianRealisasi.forEach((element) {
                listLaporan.add(ItemLaporan(
                  jenisPengajuan: "Laporan",
                  rincianLaporan: element,
                  isGet: true,
                ));
              });
              print(state.kasbon.rincianRealisasi.length);
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
                                            color: Color(0xFF358BFC))),
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
                                        color: Color(0xFF358BFC)),
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
                  if (state.kasbon.statusPencairan == 1 &&
                      state.kasbon.rincianRealisasi.isNotEmpty)
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
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
                                      "Laporan Rincian Biaya",
                                      style: GoogleFonts.montserrat(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF555555)),
                                    ),
                                  ]),
                              Container(
                                  padding: EdgeInsets.only(top: 5, bottom: 10),
                                  child:
                                      Column(children: listRincianRealisasi)),
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
                                                  .kasbon.nominalRealisasi),
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
                                  (state.kasbon.catatanLaporan != null)
                                      ? state.kasbon.catatanLaporan
                                      : "Tidak ada catatan",
                                  style: GoogleFonts.montserrat(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff555555)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (state.kasbon.statusApproval == "Belum Laporan")
                    BlocBuilder<CreateRincianBiayaBloc, BaseState>(
                        builder: (context, stateRincian) {
                      _listItemRincian.clear();
                      if (stateRincian is RincianBiayaState) {
                        print("state masuk");
                        if (!_listRincianBiaya
                            .contains(stateRincian.rincianBiaya)) {
                          _listRincianBiaya.add(stateRincian.rincianBiaya);
                          _totalBiaya += stateRincian.rincianBiaya.total;
                        }
                      } else if (stateRincian is EmptyState) {
                        _listRincianBiaya.clear();
                        _totalBiaya = 0;
                      } else if (stateRincian is DeleteRincianBiayaState) {
                        _totalBiaya -= stateRincian.rincianBiaya.total;
                        _listRincianBiaya.remove(stateRincian.rincianBiaya);
                      }
                      _listRincianBiaya.forEach((element) {
                        _listItemRincian.add(ItemRincian(
                          jenisPengajuan: "Laporan",
                          rincianBiaya: element,
                        ));
                      });
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: CustomCard(
                              container: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Laporan Rincian Biaya",
                                      style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: Color(0xFF555555)),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 7),
                                      child: (_listItemRincian.isNotEmpty)
                                          ? Column(children: _listItemRincian)
                                          : Container(),
                                    ),
                                    DottedBorder(
                                      color: Colors.grey,
                                      dashPattern: [5, 5],
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(10),
                                      strokeWidth: 1,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Container(
                                          height: 45,
                                          child: RaisedButton(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            padding: EdgeInsets.all(0),
                                            elevation: 0,
                                            onPressed: () {
                                              return showDialog(
                                                  context: context,
                                                  barrierColor: Colors.black45,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        child: FormRincianBiaya(
                                                          jenisPengajuan:
                                                              "Laporan",
                                                        ));
                                                  });
                                            },
                                            child: Ink(
                                              color: Colors.white,
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Tambahkan Laporan ",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              color:
                                                                  Colors.grey,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                    Icon(
                                                      Icons.add_link,
                                                      size: 20,
                                                      color: Colors.grey,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                            child: CustomCard(
                              container: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 20,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Total Biaya",
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: Color(0xFF555555)),
                                          ),
                                          Text(
                                            "Rp" +
                                                NumberFormat.currency(
                                                        locale: "eu",
                                                        symbol: "")
                                                    .format(_totalBiaya),
                                            style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15,
                                                color: Color(0xFF555555)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: 7, bottom: 7),
                                      child: TextFormField(
                                          maxLines: 3,
                                          controller: _catatanCtrl,
                                          decoration: InputDecoration(
                                            labelText: "Catatan Laporan",
                                            isDense: true,
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  (state.kasbon.statusApproval.contains("ditolak"))
                      ? Container(
                          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                          child: Container(
                              height: 42.0,
                              child: RaisedButton(
                                  elevation: 2,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) {
                                      Kasbon kasbon;
                                      kasbon = convertImage(state.kasbon);
                                      print(kasbon.toJson());
                                      if (widget.jenisPengajuan == "Kasbon")
                                        return UpdatePengajuanKasbon(
                                            pengajuan: kasbon);
                                      else
                                        return UpdateLaporan(
                                          kasbon: kasbon,
                                          catatanLaporan: kasbon.catatanLaporan,
                                          listRincianRealisasi:
                                              kasbon.rincianRealisasi,
                                        );
                                    }));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF358BFC),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Text(
                                              "Update " + widget.jenisPengajuan,
                                              style: GoogleFonts.montserrat(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 20,
                                                  color: Colors.white)))))))
                      : Container(),
                  // if (state.kasbon.statusPencairan == 1 &&
                  //     state.kasbon.statusPertanggungjawaban == 0)
                  if (state.kasbon.statusApproval == "Belum Laporan")
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 15,
                              child: Container(
                                height: 42.0,
                                child: RaisedButton(
                                  elevation: 2,
                                  onPressed: () {
                                    if (_listRincianBiaya.isEmpty) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Harap lengkapi Rincian Biaya Laporan")));
                                    } else {
                                      Laporan laporan = Laporan(
                                          catatanLaporan: _catatanCtrl.text,
                                          rincianRealisasi:
                                              _listRincianBiaya.cast());
                                      BlocProvider.of<KasbonBloc>(context).add(
                                          CreateLaporanEvent(
                                              idPengajuanKasbon: widget.id,
                                              laporan: laporan));
                                    }
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        color: Color(0xFF358BFC),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Kirim Laporan",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  if (state.kasbon.statusPengajuan == 1 &&
                      state.kasbon.statusPencairan == 0)
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              flex: 15,
                              child: Container(
                                height: 42.0,
                                child: RaisedButton(
                                  elevation: 2,
                                  onPressed: () {
                                    BlocProvider.of<KasbonBloc>(context)
                                        .add(CancelKasbonEvent(id: widget.id));
                                  },
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        color: Color(0xfff54949),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Batalkan",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    )
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

  Kasbon convertImage(Kasbon kasbon) {
    for (int i = 0; i < kasbon.rincianPengajuan.length; i++) {
      for (int j = 0; j < kasbon.rincianPengajuan[i].images.length; j++) {
        kasbon.rincianPengajuan[i].action = "update";
        if (kasbon.rincianPengajuan[i].images[j].action == null)
          imgUrltoFile(kasbon.rincianPengajuan[i].images[j].image).then(
              (value) => kasbon.rincianPengajuan[i].images[j].image = value);
        kasbon.rincianPengajuan[i].images[j].action = "update";
      }
    }
    if (kasbon.rincianRealisasi.isNotEmpty)
      for (int i = 0; i < kasbon.rincianRealisasi.length; i++) {
        for (int j = 0; j < kasbon.rincianRealisasi[i].images.length; j++) {
          kasbon.rincianRealisasi[i].action = "update";
          if (kasbon.rincianRealisasi[i].images[j].action == null)
            imgUrltoFile(kasbon.rincianRealisasi[i].images[j].image).then(
                (value) => kasbon.rincianRealisasi[i].images[j].image = value);
          kasbon.rincianRealisasi[i].images[j].action = "update";
        }
      }
    return kasbon;
  }

  Future<String> imgUrltoFile(String img) async {
    final ByteData imageData =
        await NetworkAssetBundle(Uri.parse(img)).load("");
    final List<int> bytes = imageData.buffer.asUint8List();
    return base64Encode(bytes);
  }
}
