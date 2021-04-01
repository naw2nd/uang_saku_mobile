import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/create_reimburse_bloc.dart';
import 'package:uang_saku/bloc/event/create_reimburse_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/custom_datepicker.dart';
import 'package:uang_saku/ui/custom_widgets/custom_dropdown_form_field.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
import 'package:uang_saku/ui/widgets/rincian_biaya.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:intl/intl.dart';

class CreatePengajuan extends StatefulWidget {
  final String jenisPengajuan;
  CreatePengajuan({this.jenisPengajuan});
  @override
  _CreatePengajuanState createState() => _CreatePengajuanState();
}

class _CreatePengajuanState extends State<CreatePengajuan> {
  var colorTheme;
  List<String> listPerusahaan = [
    "PT Wahana Rizky Gumilang",
    "PT Wahana Meditek Indonesia"
  ];
  List<String> listCabang = ["Surabaya", "Wano"];
  List<String> listJenisPencairan = ["Cash", "Tunai"];
  List<String> listKategori = ["Entertain", "Rapat", "Teknis"];
  List<Widget> listPelakasana = List<Widget>();
  TextEditingController tujuanCtrl = TextEditingController();
  TextEditingController agendaCtrl = TextEditingController();
  TextEditingController catatanCtrl = TextEditingController();
  TextEditingController tanggalMulaiCtrl = TextEditingController();
  TextEditingController tanggalSelesaiCtrl = TextEditingController();
  List<TextEditingController> pelaksana = List<TextEditingController>();
  TextEditingController lokasiCtrl = TextEditingController();
  TextEditingController infoCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreateReimburseBloc>().add(GetMenuItemsEvent());

    if (widget.jenisPengajuan == "Reimburse")
      colorTheme = Color(0xFF3AE3CE);
    else if (widget.jenisPengajuan == "Kasbon")
      colorTheme = Color(0xFF358BFC);
    else
      colorTheme = Color(0xFF2B4D66);

    pelaksana.add(TextEditingController());
    listPelakasana = _generateListFormPelaksana();
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
          backgroundColor: colorTheme,
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
          child:
              BlocBuilder<CreateReimburseBloc, BaseState>(builder: (_, state) {
            if (state is CreatePengajuanState) {
              listKategori.clear();
              state.listKategori.forEach((element) {
                listKategori.add(element.namaKategoriPengajuan);
              });

              listCabang.clear();
              state.listCabang.forEach((element) {
                listCabang.add(element.namaCabang);
              });

              listPerusahaan.clear();
              state.listPerusahaan.forEach((element) {
                listPerusahaan.add(element.namaPerusahaan);
              });
            }

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
                          controller: tujuanCtrl,
                        ),
                        CustomDropdownFormField(
                            label: "Kategori Pengajuan", items: listKategori),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Flexible(
                                flex: 15,
                                child: CustomDatepicker(
                                  controller: tanggalMulaiCtrl,
                                  label: "Tanggal Mulai",
                                )),
                            Flexible(flex: 1, child: Container()),
                            Flexible(
                                flex: 15,
                                child: CustomDatepicker(
                                  controller: tanggalSelesaiCtrl,
                                  label: "Tanggal Selesai",
                                  // start: (tanggalMulaiCtrl.text != "")
                                  //     ? DateFormat('MMMM d, yyyy', 'en_US')
                                  //         .parse(tanggalMulaiCtrl.text)
                                  //     : null,
                                ))
                          ],
                        ),
                        CustomDropdownFormField(
                            label: "Perusahaan", items: listPerusahaan),
                        CustomDropdownFormField(
                            label: "Cabang", items: listCabang),
                        CustomDropdownFormField(
                            label: "Jenis Pencairan",
                            items: listJenisPencairan),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Info Tambahan",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFF555555)),
                              ),
                              Text(
                                "Perjalanan Dinas",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 13,
                                    color: Color(0xFFA8A8A8)),
                              ),
                            ],
                          ),
                        ),
                        CustomTextFormField(
                          label: "Lokasi Tujuan",
                          controller: lokasiCtrl,
                          validation: ["required"],
                        ),
                        CustomTextFormField(
                          label: "Agenda",
                          controller: agendaCtrl,
                          validation: ["required"],
                          lines: 3,
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
                            children: listPelakasana,
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          dashPattern: [5, 5],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          strokeWidth: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 45,
                              child: Builder(
                                builder: (context) => RaisedButton(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  padding: EdgeInsets.all(0),
                                  elevation: 0,
                                  onPressed: () {
                                    bool empty = false;
                                    pelaksana.forEach((element) {
                                      if (element.text == "") empty = true;
                                    });
                                    if (empty) {
                                      Scaffold.of(context).showSnackBar(SnackBar(
                                          content: Text(
                                              "Harap mengisi form pelaksana yang masih kosong")));
                                    } else {
                                      pelaksana.add(TextEditingController());
                                      setState(() {
                                        listPelakasana =
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
                CustomCard(
                  container: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Rincian Biaya",
                          style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: Color(0xFF555555)),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Perawatan",
                                        style: GoogleFonts.montserrat(
                                            color: Color(0xFF555555),
                                            fontWeight: FontWeight.w600)),
                                    Container(
                                      child: Icon(
                                        Icons.attach_file,
                                        color: Color(0xFFA8A8A8),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    child: Text(
                                        "Sisir kucing extra smooth uwserbgosbu jiresrohipg nklresud ibh",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: GoogleFonts.montserrat()),
                                  ),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    width:
                                        MediaQuery.of(context).size.width / 2 -
                                            40,
                                    child: Text(
                                      "Rp134.000.000,00",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.montserrat(),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          dashPattern: [5, 5],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          strokeWidth: 1,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Container(
                              height: 45,
                              child: RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(0),
                                elevation: 0,
                                onPressed: () => showDialog(
                                    context: context,
                                    barrierColor: Colors.black45,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: RincianBiaya(
                                            jenisPengajuan:
                                                widget.jenisPengajuan,
                                          ));
                                    }),
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
                                              fontWeight: FontWeight.w500),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Biaya",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: Color(0xFF555555)),
                              ),
                              Text(
                                "Rp256.000,00",
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
                          controller: catatanCtrl,
                          validation: [],
                          lines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
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
                              .parse(tanggalSelesaiCtrl.text)
                              .isBefore(DateFormat('MMMM d, yyyy', 'en_US')
                                  .parse(tanggalMulaiCtrl.text))) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Harap masukkan tanggal yang benar")));
                          }
                          print("validated");
                          BlocProvider.of<CreateReimburseBloc>(context).add(
                              CreateReimburseEvent(
                                  reimburse: dummyReimburse()));
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
                              color: colorTheme),
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
          }),
        )),
      ),
    );
  }

  List<Widget> _generateListFormPelaksana() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < pelaksana.length; i++) {
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
              controller: pelaksana[i],
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
                    pelaksana.removeAt(i);
                    setState(() {
                      listPelakasana = _generateListFormPelaksana();
                    });
                  })
              : Container()
        ]),
      ));
    }
    return list;
  }

  Reimburse dummyReimburse() {
    Reimburse r;
    r = new Reimburse(tujuan: "nonsense");
    return r;
  }
}
