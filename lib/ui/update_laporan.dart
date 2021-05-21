import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/event/laporan_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/laporan.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/item_rincian.dart';
import 'package:uang_saku/ui/bottom_navbar.dart';
import 'package:uang_saku/ui/custom_widgets/form_rincian_biaya.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

class UpdateLaporan extends StatefulWidget {
  final Kasbon kasbon;
  final String catatanLaporan;
  final List<RincianRealisasi> listRincianRealisasi;
  UpdateLaporan({this.kasbon, this.catatanLaporan, this.listRincianRealisasi});
  @override
  _UpdateLaporanState createState() => _UpdateLaporanState();
}

class _UpdateLaporanState extends State<UpdateLaporan> {
  var _colorTheme = Color(0xFF358BFC);
  List _listRincianBiaya = [];
  List<Widget> _listItemRincian = [];
  TextEditingController _catatanCtrl = TextEditingController();
  int _totalBiaya = 0;
  List deletedRincianBiaya = [];

  @override
  void initState() {
    BlocProvider.of<CreateRincianBiayaBloc>(context).add(EmptyEvent());
    if (widget.catatanLaporan != "") _catatanCtrl.text = widget.catatanLaporan;
    _listRincianBiaya = widget.listRincianRealisasi;
    _totalBiaya = widget.kasbon.nominalRealisasi;
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
          backgroundColor: _colorTheme,
          title: Text("Form Update Kasbon",
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                })
          ],
        ),
        body: SingleChildScrollView(
          child:
              BlocConsumer<KasbonBloc, BaseState>(listener: (context, state) {
            if (state is SuccesState) {
              Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text("Reimburse berhasil dikirimkan")));
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
          }, builder: (context, state) {
            return Column(
              children: [
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
                    // _listRincianBiaya.clear();
                    // _totalBiaya = 0;
                  } else if (stateRincian is DeleteRincianBiayaState) {
                    _totalBiaya -= stateRincian.rincianBiaya.total;
                    stateRincian.rincianBiaya.action = "delete";
                    stateRincian.rincianBiaya.total = 0;
                    deletedRincianBiaya.add(stateRincian.rincianBiaya);

                    _listRincianBiaya.remove(stateRincian.rincianBiaya);
                  }
                  _listRincianBiaya.forEach((element) {
                    _listItemRincian.add(ItemRincian(
                      jenisPengajuan: "Laporan",
                      rincianBiaya: element, //isGet: true,
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
                                  "Rincian Biaya",
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
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
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                    shape:
                                                        RoundedRectangleBorder(
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
                                                  "Tambahkan Rincian Biaya ",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.grey,
                                                      fontWeight:
                                                          FontWeight.w500),
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
                                                    locale: "eu", symbol: "")
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
                                  margin: EdgeInsets.only(top: 7, bottom: 7),
                                  child: TextFormField(
                                      maxLines: 3,
                                      controller: _catatanCtrl,
                                      decoration: InputDecoration(
                                        labelText: "Catatan",
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
                Container(
                    padding: EdgeInsets.fromLTRB(15, 0, 15, 5),
                    child: Container(
                        height: 42.0,
                        child: RaisedButton(
                            elevation: 2,
                            onPressed: () {
                              Laporan laporan = Laporan(catatanLaporan: _catatanCtrl.text, rincianRealisasi: _listRincianBiaya.cast());
                              laporan.rincianRealisasi.addAll(deletedRincianBiaya.cast());
                              print(laporan.toJson());
                              // BlocProvider.of<KasbonBloc>(context).add(
                              //     CreateLaporanEvent(
                              //         idPengajuanKasbon:
                              //             widget.kasbon.idPengajuanKasbon,
                              //         laporan: laporan));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                                decoration: BoxDecoration(
                                    color: _colorTheme,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Update Laporan",
                                        style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                            color: Colors.white)))))))
              ],
            );
          }),
        ),
      ),
    );
  }
}
