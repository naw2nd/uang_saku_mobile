import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/create_pengajuan_bloc.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/event/create_pengajuan_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';
import 'package:uang_saku/ui/custom_widgets/item_rincian.dart';
import 'package:uang_saku/ui/detail_rincian_biaya.dart';
import 'package:uang_saku/ui/main_page.dart';
import 'package:uang_saku/ui/bottom_navbar.dart';
import 'package:uang_saku/ui/form_rincian_biaya.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

class CreatePengajuan extends StatefulWidget {
  final String jenisPengajuan;
  CreatePengajuan({this.jenisPengajuan});
  @override
  _CreatePengajuanState createState() => _CreatePengajuanState();
}

class _CreatePengajuanState extends State<CreatePengajuan> {
  var _colorTheme;
  List<String> _listJenisPencairan = ["Cash", "Transfer"];
  List<String> pelaksana = [];
  List<TextEditingController> _listPelaksanaCtrl = [];
  List<Widget> _listPelakasana = [];
  List _listRincianBiaya = [];
  List<Widget> _listItemRincian = [];
  TextEditingController _tujuanCtrl = TextEditingController();
  TextEditingController _catatanCtrl = TextEditingController();
  TextEditingController _tanggalMulaiCtrl = TextEditingController();
  TextEditingController _tanggalSelesaiCtrl = TextEditingController();
  KategoriPengajuan _selectedKategoriPengajuan;
  Perusahaan _selectedPerusahaan;
  Department _selectedDepartment;
  Cabang _selectedCabang;
  String _selectedJenisPencairan;
  int _totalBiaya = 0;
  DateTime _tglMulai;
  DateTime _tglSelesai;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    BlocProvider.of<CreatePengajuanBloc>(context).add(InitEvent());
    BlocProvider.of<CreateRincianBiayaBloc>(context).add(EmptyEvent());

    if (widget.jenisPengajuan == "Reimburse")
      _colorTheme = Color(0xFF3AE3CE);
    else if (widget.jenisPengajuan == "Kasbon")
      _colorTheme = Color(0xFF358BFC);
    else
      _colorTheme = Color(0xFF2B4D66);

    _listPelaksanaCtrl.add(TextEditingController());
    _listPelakasana = _generateListFormPelaksana();
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
          title: Text("Form Pengajuan " + widget.jenisPengajuan,
              style: GoogleFonts.montserrat(
                  fontSize: 18, fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: BlocConsumer<CreatePengajuanBloc, BaseState>(
              listener: (context, state) {
            if (state is SuccesState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                  content:
                      Text(widget.jenisPengajuan + " berhasil dikirimkan")));
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
            if (state is CreatePengajuanState) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                    child: CustomCard(
                      container: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Detail Pengajuan",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF555555)),
                            ),
                            CustomTextFormField(
                              label: "Tujuan",
                              validation: ["required"],
                              controller: _tujuanCtrl,
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(13),
                                    labelText: "Kategori Pengajuan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: _selectedKategoriPengajuan,
                                validator: (value) => (value == null)
                                    ? "Kategori Pengajuan harus diisi"
                                    : null,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedKategoriPengajuan = newValue;
                                  });
                                },
                                items: state.listKategori.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.namaKategoriPengajuan),
                                  );
                                }).toList(),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                    flex: 15,
                                    child: Container(
                                        margin:
                                            EdgeInsets.only(top: 7, bottom: 7),
                                        child: TextFormField(
                                            readOnly: true,
                                            controller: _tanggalMulaiCtrl,
                                            validator: (value) => value.isEmpty
                                                ? " Tgl Mulai harus diisi"
                                                : null,
                                            decoration: InputDecoration(
                                                labelText: "Tanggal Mulai",
                                                isDense: true,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10))),
                                            onTap: () {
                                              _selectDate(
                                                  context, _tglMulai, false);
                                            }))),
                                Flexible(flex: 1, child: Container()),
                                Flexible(
                                    flex: 15,
                                    child: Container(
                                      margin:
                                          EdgeInsets.only(top: 7, bottom: 7),
                                      child: TextFormField(
                                          readOnly: true,
                                          controller: _tanggalSelesaiCtrl,
                                          validator: (value) => value.isEmpty
                                              ? " Tgl Selesai harus diisi"
                                              : null,
                                          decoration: InputDecoration(
                                              labelText: "Tanggal Selesai",
                                              isDense: true,
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onTap: () {
                                            _selectDate(
                                                context, _tglSelesai, true);
                                          }),
                                    ))
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(13),
                                    labelText: "Perusahaan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: _selectedPerusahaan,
                                validator: (value) => (value == null)
                                    ? "Perusahaan harus diisi"
                                    : null,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedPerusahaan = newValue;
                                  });
                                },
                                items: state.listPerusahaan.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.namaPerusahaan),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(13),
                                    labelText: "Department",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: _selectedDepartment,
                                validator: (value) => (value == null)
                                    ? "Department harus diisi"
                                    : null,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedDepartment = newValue;
                                  });
                                },
                                items: state.listDepartment.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.namaDepartment),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(13),
                                    labelText: "Cabang",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: _selectedCabang,
                                validator: (value) => (value == null)
                                    ? "Cabang harus diisi"
                                    : null,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedCabang = newValue;
                                  });
                                },
                                items: state.listCabang.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value.namaCabang),
                                  );
                                }).toList(),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 7, bottom: 7),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(13),
                                    labelText: "Jenis Pencairan",
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                value: _selectedJenisPencairan,
                                validator: (value) => (value == null)
                                    ? "Jenis Pencairan harus diisi"
                                    : null,
                                isDense: true,
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedJenisPencairan = newValue;
                                  });
                                },
                                items: _listJenisPencairan.map((value) {
                                  return DropdownMenuItem(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                    child: CustomCard(
                      container: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Pelaksana",
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: Color(0xFF555555)),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 7),
                              child: Column(
                                children: _listPelakasana,
                              ),
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
                                  child: Builder(
                                    builder: (context) => RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding: EdgeInsets.all(0),
                                      elevation: 0,
                                      onPressed: () {
                                        bool empty = false;
                                        _listPelaksanaCtrl.forEach((element) {
                                          if (element.text == "") empty = true;
                                        });
                                        if (empty) {
                                          Scaffold.of(context).showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      "Harap mengisi form pelaksana yang masih kosong")));
                                        } else {
                                          _listPelaksanaCtrl
                                              .add(TextEditingController());
                                          setState(() {
                                            _listPelakasana =
                                                _generateListFormPelaksana();
                                          });
                                        }
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
                                                "Tambahkan Pelaksana ",
                                                style: GoogleFonts.montserrat(
                                                    color: Colors.grey,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Icon(
                                                Icons.person_add_alt_1,
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                        jenisPengajuan: widget.jenisPengajuan,
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
                                                builder:
                                                    (BuildContext context) {
                                                  return Dialog(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                      child: FormRincianBiaya(
                                                        jenisPengajuan: widget
                                                            .jenisPengajuan,
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
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            color: Colors.grey,
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
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                    height: 50,
                    child: Builder(
                      builder: (context) => RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(0),
                        elevation: 0,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            if (_listRincianBiaya.isEmpty) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Harap lengkapi Rincian Biaya " +
                                          widget.jenisPengajuan)));
                            } else {
                              _listPelaksanaCtrl.forEach((element) {
                                pelaksana.add(element.text);
                              });
                              if (widget.jenisPengajuan == "Reimburse")
                                _postReimburse();
                              else
                                _postKasbon();
                            }
                          } else {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Harap lengkapi form yang masih kosong")));
                          }
                        },
                        child: Container(
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: _colorTheme),
                            child: Container(
                              alignment: Alignment.center,
                              child: Text("Kirim " + widget.jenisPengajuan,
                                  style: GoogleFonts.montserrat(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container(
                  padding: EdgeInsets.only(top: 200),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator());
            }
          }),
        )),
      ),
    );
  }

  _selectDate(BuildContext context, DateTime init, bool end) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: (init != null)
            ? init
            : (!end || _tglMulai == null)
                ? DateTime.now()
                : _tglMulai,
        firstDate: (_tglMulai != null && end) ? _tglMulai : DateTime(1945),
        lastDate: (_tglSelesai != null && !end) ? _tglSelesai : DateTime(2045),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light(),
            child: child,
          );
        });
    if (newSelectedDate != null) {
      if (!end) {
        _tglMulai = newSelectedDate;
        _tanggalMulaiCtrl.text = DateFormat.yMMMMd('en_US').format(_tglMulai);
      } else {
        _tglSelesai = newSelectedDate;
        _tanggalSelesaiCtrl.text =
            DateFormat.yMMMMd('en_US').format(_tglSelesai);
      }
    }
  }

  _postReimburse() {
    Reimburse reimburse = Reimburse(
        tujuan: _tujuanCtrl.text,
        idKategoriPengajuan: _selectedKategoriPengajuan.idKategoriPengajuan,
        tglMulai: DateFormat.yMMMMd('en_US').parse(_tanggalMulaiCtrl.text),
        tglSelesai: DateFormat.yMMMMd('en_US').parse(_tanggalSelesaiCtrl.text),
        idPerusahaan: _selectedPerusahaan.idPerusahaan,
        idDepartment: _selectedDepartment.idDepartment,
        idCabang: _selectedCabang.idCabang,
        jenisPencairan: _selectedJenisPencairan.toLowerCase(),
        pelaksana: pelaksana,
        catatan: _catatanCtrl.text,
        rincianRealisasi: _listRincianBiaya.cast());
    print(reimburse.toJson());
    BlocProvider.of<CreatePengajuanBloc>(context)
        .add(CreateReimburseEvent(reimburse: reimburse));
  }

  _postKasbon() {
    Kasbon kasbon = Kasbon(
        tujuan: _tujuanCtrl.text,
        idKategoriPengajuan: _selectedKategoriPengajuan.idKategoriPengajuan,
        tglMulai: DateFormat.yMMMMd('en_US').parse(_tanggalMulaiCtrl.text),
        tglSelesai: DateFormat.yMMMMd('en_US').parse(_tanggalSelesaiCtrl.text),
        idPerusahaan: _selectedPerusahaan.idPerusahaan,
        idDepartment: _selectedDepartment.idDepartment,
        idCabang: _selectedCabang.idCabang,
        jenisPencairan: _selectedJenisPencairan.toLowerCase(),
        pelaksana: pelaksana,
        catatanPengajuan: _catatanCtrl.text,
        rincianPengajuan: _listRincianBiaya.cast());
    print(kasbon.toJson());
    BlocProvider.of<CreatePengajuanBloc>(context)
        .add(CreateKasbonEvent(kasbon: kasbon));
  }

  List<Widget> _generateListFormPelaksana() {
    List<Widget> list = [];
    for (int i = 0; i < _listPelaksanaCtrl.length; i++) {
      list.add(Container(
        margin: EdgeInsets.only(top: 7, bottom: 7),
        child: Stack(alignment: Alignment.topRight, children: [
          TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  if (i == 0)
                    return "Pelaksana harus diisi minimal 1 orang";
                  else
                    return "Hapus form jika Pelaksana " +
                        (i + 1).toString() +
                        " kosong";
                } else
                  return null;
              },
              controller: _listPelaksanaCtrl[i],
              decoration: InputDecoration(
                  labelText: "Pelaksana " + (i + 1).toString(),
                  isDense: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)))),
          (i != 0)
              ? IconButton(
                  icon: Icon(
                    Icons.remove_circle_outline,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _listPelaksanaCtrl.removeAt(i);
                    setState(() {
                      _listPelakasana = _generateListFormPelaksana();
                    });
                  })
              : Container()
        ]),
      ));
    }
    return list;
  }
}
