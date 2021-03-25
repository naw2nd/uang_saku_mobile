import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/create_reimburse_bloc.dart';
import 'package:uang_saku/bloc/event/create_reimburse_event.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/custom_widgets/custom_datepicker.dart';
import 'package:uang_saku/ui/custom_widgets/custom_dropdown_form_field.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
import 'package:uang_saku/ui/widgets/rincian_biaya.dart';
import 'package:dotted_border/dotted_border.dart';

class CreatePengajuan extends StatefulWidget {
  final String jenisPengajuan;

  // RincianBiaya rincianBiaya = new RincianBiaya(
  //   judul: "Rincian Kasbon",
  //   buttonColor: Color(0xFF358BFC),
  // );

  CreatePengajuan({this.jenisPengajuan});
  @override
  _CreatePengajuanState createState() => _CreatePengajuanState();
}

class _CreatePengajuanState extends State<CreatePengajuan> {
  var colorTheme;
  List<String> perusahaan = [
    "PT Wahana Rizky Gumilang",
    "PT Wahana Meditek Indonesia"
  ];
  List<String> cabang = ["Surabaya", "Malang"];
  List<String> jenisPencairan = ["Cash", "Tunai"];
  List<String> kategori = ["Entertain", "Rapat", "Teknis"];
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.jenisPengajuan == "Reimburse")
      colorTheme = Color(0xFF3AE3CE);
    else if (widget.jenisPengajuan == "Kasbon")
      colorTheme = Color(0xFF358BFC);
    else
      colorTheme = Color(0xFF2B4D66);
    super.initState();
  }

  // RincianBiaya rincianBiaya = new RincianBiaya(
  //   judul: "Rincian Kasbon",
  //   buttonColor: Color(0xFF358BFC),
  // );

  // _showDialog() async {
  //   await Future.delayed(Duration(milliseconds: 50));
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return rincianBiaya;
  //       });
  // }

  // String showPerusahaan;
  // String showCabang;
  // String showMetodeBayar;
  // String showKategori;
  // DateTime currentDate = DateTime.now();
  // DateTime endDate = DateTime.now();
  TextEditingController tujuan = TextEditingController();
  TextEditingController lokasi = TextEditingController();
  TextEditingController agenda = TextEditingController();
  TextEditingController catatan = TextEditingController();
  TextEditingController pelakasana = TextEditingController();
  TextEditingController tanggalMulai = TextEditingController();
  TextEditingController tanggalSelesai = TextEditingController();

  final controllerInput = TextEditingController();
  final listChips = <String>[];

  sendData(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPengajuan(
                  tujuanHolder: tujuan.text,
                )));
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
        body: Form(
          key: _formKey,
          child: ListView(
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
                        controller: tujuan,
                      ),
                      CustomDropdownFormField(
                          label: "Kategori Pengajuan", items: kategori),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                              flex: 15,
                              child: CustomDatepicker(
                                controller: tanggalMulai,
                                label: "Tanggal Mulai",
                              )),
                          Flexible(flex: 1, child: Container()),
                          Flexible(
                              flex: 15,
                              child: CustomDatepicker(
                                controller: tanggalSelesai,
                                label: "Tanggal Selesai",
                              ))
                        ],
                      ),
                      CustomDropdownFormField(
                          label: "Perusahaan", items: perusahaan),
                      CustomDropdownFormField(label: "Cabang", items: cabang),
                      CustomDropdownFormField(
                          label: "Jenis Pencairan", items: jenisPencairan),
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
                        controller: lokasi,
                        validation: ["required"],
                      ),
                      CustomTextFormField(
                        label: "Agenda",
                        controller: agenda,
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
                      CustomTextFormField(
                        label: "Pelaksana 1",
                        controller: pelakasana,
                        validation: ["required"],
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
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tambahkan Pelaksana",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(16.0),
                      //   child: Column(
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: [
                      //       TextField(
                      //         decoration: const InputDecoration(
                      //           hintStyle: TextStyle(color: Colors.black45),
                      //           errorStyle: TextStyle(color: Colors.redAccent),
                      //           border: OutlineInputBorder(),
                      //           labelText: 'Input Pelaksana',
                      //         ),
                      //         controller: controllerInput,
                      //         onSubmitted: (value) {
                      //           setState(() {
                      //             controllerInput.text = '';
                      //             listChips.add(value);
                      //           });
                      //         },
                      //         // decoration: InputDecoration(
                      //         //   hintText: 'Tambahkan Pelaksana',
                      //         //   isDense: true,
                      //         // ),
                      //         keyboardType: TextInputType.emailAddress,
                      //       ),
                      //       Wrap(
                      //         children: listChips.map((e) {
                      //           return InputChip(
                      //             avatar: CircleAvatar(
                      //               child: Icon(Icons.account_circle),
                      //             ),
                      //             label: Text(e),
                      //             onDeleted: () =>
                      //                 setState(() => listChips.remove(e)),
                      //           );
                      //         }).toList(),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Center(
                      //   child: Container(
                      //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      //     child: RaisedButton(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(11)),
                      //       color: colorTheme,
                      //       onPressed: () {
                      //         if (_formKey.currentState.validate()) {
                      //           print("validated");
                      //           BlocProvider.of<CreateReimburseBloc>(context)
                      //               .add(CreateReimburseEvent(
                      //                   reimburse: dummyReimburse()));
                      //         }
                      //       },
                      //       child: Text("Tambahkan Pelaksana +",
                      //           style: TextStyle(
                      //               fontFamily: "Montserrat",
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600)),
                      //     ),
                      //   ),
                      // ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Container(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      40,
                                  child: Text(
                                      "Sisir kucing extra smooth uwserbgosbu jiresrohipg nklresud ibh",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: GoogleFonts.montserrat()),
                                ),
                                Container(
                                  alignment: Alignment.centerRight,
                                  width: MediaQuery.of(context).size.width / 2 -
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
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 12, bottom: 12),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Tambahkan Rincian Biaya",
                                  style: GoogleFonts.montserrat(
                                      color: Colors.grey[400],
                                      fontWeight: FontWeight.w500),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.grey[400],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Center(
                      //   child: Container(
                      //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      //     child: RaisedButton(
                      //       shape: RoundedRectangleBorder(
                      //           borderRadius: BorderRadius.circular(11)),
                      //       color: colorTheme,
                      //       onPressed: () {
                      //         // showDialog(
                      //         //     context: context,
                      //         //     builder: (BuildContext context) {
                      //         //       return rincianBiaya;
                      //         //     });
                      //         // _showDialog();
                      //       },
                      //       child: Text("Tambahkan Rincian Biaya +",
                      //           style: TextStyle(
                      //               fontFamily: "Montserrat",
                      //               color: Colors.white,
                      //               fontWeight: FontWeight.w600)),
                      //     ),
                      //   ),
                      // ),
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
                        controller: catatan,
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
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("validated");
                      BlocProvider.of<CreateReimburseBloc>(context).add(
                          CreateReimburseEvent(reimburse: dummyReimburse()));
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
            ],
          ),
        ),
      ),
    );
  }

  Reimburse dummyReimburse() {
    Reimburse r;
    r = new Reimburse();
    r.tujuan = "nonosense";
    return r;
  }
}
