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
import 'package:uang_saku/ui/custom_widgets/custom_datepicker.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';
import 'package:uang_saku/ui/detail_rincian_biaya.dart';
import 'package:uang_saku/ui/widgets/form_rincian_biaya.dart';
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
  List<TextEditingController> _listPelaksanaCtrl =
      List<TextEditingController>();
  List<Widget> _listPelakasana = List<Widget>();
  List<RincianRealisasi> _listRincianRealisasi = List<RincianRealisasi>();
  List<Widget> _listItemRincian = List<Widget>();
  TextEditingController _tujuanCtrl = TextEditingController();
  TextEditingController _catatanCtrl = TextEditingController();
  TextEditingController _tanggalMulaiCtrl = TextEditingController();
  TextEditingController _tanggalSelesaiCtrl = TextEditingController();
  KategoriPengajuan _selectedKategoriPengajuan;
  Perusahaan _selectedPerusahaan;
  Cabang _selectedCabang;
  String _selectedJenisPencairan;
  int _totalBiaya = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreatePengajuanBloc>().add(InitPengajuanEvent());
    // context.read<CreateRincianBiayaBloc>().add(InitPengajuanEvent());

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
                  BlocProvider.of<CreatePengajuanBloc>(context)
                      .add(CreateReimburseEvent());
                  BlocProvider.of<CreateRincianBiayaBloc>(context)
                      .add(CreateReimburseEvent());
                  Navigator.pop(context);
                })
          ],
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child:
              BlocBuilder<CreatePengajuanBloc, BaseState>(builder: (_, state) {
            if (state is CreatePengajuanState) {
              // listItemRincian.clear();

              return Column(
                children: [
                  CustomCard(
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
                                      borderRadius: BorderRadius.circular(10))),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Flexible(
                                  flex: 15,
                                  child: CustomDatepicker(
                                    controller: _tanggalMulaiCtrl,
                                    label: "Tanggal Mulai",
                                  )),
                              Flexible(flex: 1, child: Container()),
                              Flexible(
                                  flex: 15,
                                  child: CustomDatepicker(
                                    controller: _tanggalSelesaiCtrl,
                                    label: "Tanggal Selesai",
                                    // start: (tanggalMulaiCtrl.text != "")
                                    //     ? DateFormat('MMMM d, yyyy', 'en_US')
                                    //         .parse(tanggalMulaiCtrl.text)
                                    //     : null,
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
                                      borderRadius: BorderRadius.circular(10))),
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
                                  labelText: "Cabang",
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              value: _selectedCabang,
                              validator: (value) =>
                                  (value == null) ? "Cabang harus diisi" : null,
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
                                      borderRadius: BorderRadius.circular(10))),
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
                  CustomCard(
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
                                        Scaffold.of(context).showSnackBar(SnackBar(
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
                                                  fontWeight: FontWeight.w500),
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
                  BlocBuilder<CreateRincianBiayaBloc, BaseState>(
                      builder: (_, stateRincian) {
                    if (stateRincian is RincianBiayaState) {
                      if (!_listRincianRealisasi
                          .contains(stateRincian.rincianRealisasi)) {
                        _listRincianRealisasi
                            .add(stateRincian.rincianRealisasi);
                        _totalBiaya += stateRincian.rincianRealisasi.total;
                      }
                    }
                    _listItemRincian.clear();
                    _listRincianRealisasi.forEach((element) {
                      _listItemRincian.add(ItemRincian(
                        rincianRealisasi: element,
                      ));
                    });
                    print("obj" + _listRincianRealisasi.length.toString());
                    print("wdg" + _listItemRincian.length.toString());
                    return Column(
                      children: [
                        CustomCard(
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
                                                          widget.jenisPengajuan,
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
                        CustomCard(
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
                                            fontSize: 13,
                                            color: Color(0xFF555555)),
                                      ),
                                    ],
                                  ),
                                ),
                                CustomTextFormField(
                                  label: "Catatan",
                                  controller: _catatanCtrl,
                                  validation: [],
                                  lines: 3,
                                ),
                              ],
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
                            if (DateFormat('MMMM d, yyyy', 'en_US')
                                .parse(_tanggalSelesaiCtrl.text)
                                .isBefore(DateFormat('MMMM d, yyyy', 'en_US')
                                    .parse(_tanggalMulaiCtrl.text))) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      "Harap masukkan tanggal yang benar")));
                            }
                            List<String> pelaksana = List<String>();
                            _listPelaksanaCtrl.forEach((element) {
                              pelaksana.add(element.text);
                            });
                            Reimburse reimburse = Reimburse(
                                tujuan: _tujuanCtrl.text,
                                idKategoriPengajuan: _selectedKategoriPengajuan
                                    .idKategoriPengajuan,
                                tglMulai: DateFormat.yMMMMd('en_US')
                                    .parse(_tanggalMulaiCtrl.text),
                                tglSelesai: DateFormat.yMMMMd('en_US')
                                    .parse(_tanggalSelesaiCtrl.text),
                                idPerusahaan: _selectedPerusahaan.idPerusahaan,
                                idCabang: _selectedCabang.idCabang,
                                jenisPencairan:
                                    _selectedJenisPencairan.toLowerCase(),
                                pelaksana: pelaksana,
                                catatan: _catatanCtrl.text,
                                rincianRealisasi: _listRincianRealisasi);
                            print(reimburse.toJson());
                            BlocProvider.of<CreatePengajuanBloc>(context).add(
                                CreateReimburseEvent(reimburse: reimburse));
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

  List<Widget> _generateListFormPelaksana() {
    List<Widget> list = List<Widget>();
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

class ItemRincian extends StatelessWidget {
  final RincianRealisasi rincianRealisasi;
  ItemRincian({this.rincianRealisasi});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          barrierColor: Colors.black45,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: DetailRincianBiaya(
                  jenisPengajuan: "Reimburse",
                  rincianBiaya: rincianRealisasi,
                ));
          }),
      child: Container(
          margin: EdgeInsets.only(top: 7, bottom: 7),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(rincianRealisasi.kategoriBiaya.namaKategoriBiaya,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.w600)),
                  (rincianRealisasi.images.isNotEmpty)
                      ? Container(
                          child: Icon(
                            Icons.attach_file,
                            color: Color(0xFFA8A8A8),
                          ),
                        )
                      : Container()
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 40,
                    child: Text(rincianRealisasi.namaItem,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: GoogleFonts.montserrat()),
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width / 2 - 40,
                      child: Text(
                          "Rp" +
                              NumberFormat.currency(locale: "eu", symbol: "")
                                  .format(rincianRealisasi.total),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: GoogleFonts.montserrat()))
                ])
          ])),
    );
  }
}