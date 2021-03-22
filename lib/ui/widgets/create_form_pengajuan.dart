import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/detail_laporan.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
import 'package:uang_saku/ui/widgets/rincian_biaya.dart';

class CreatePengajuan extends StatefulWidget {
  String judul = "Detail Pengajuan Kasbon";
  var buttonColor = Color(0xFF3AE3CE);
  var appBarColor = Color(0xFF3AE3CE);

  RincianBiaya rincianBiaya = new RincianBiaya(
    judul: "Rincian Kasbon",
    buttonColor: Color(0xFF358BFC),
  );

  CreatePengajuan(
      {this.judul, this.buttonColor, this.appBarColor, this.rincianBiaya});
  @override
  _CreatePengajuanState createState() => _CreatePengajuanState(
      judul: judul,
      buttonColor: buttonColor,
      rincianBiaya: rincianBiaya,
      appBarColor: appBarColor);
}

class _CreatePengajuanState extends State<CreatePengajuan> {
  String judul = "Form Pengajuan Kasbon";
  var buttonColor = Color(0xFF3AE3CE);
  var appBarColor = Color(0xFF3AE3CE);

  RincianBiaya rincianBiaya = new RincianBiaya(
    judul: "Rincian Kasbon",
    buttonColor: Color(0xFF358BFC),
  );

  _showDialog() async {
    await Future.delayed(Duration(milliseconds: 50));
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return rincianBiaya;
        });
  }

  String showPerusahaan;
  String showCabang;
  String showMetodeBayar;
  String showKategori;
  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController tujuan = TextEditingController();
  TextEditingController tanggalMulai = TextEditingController();
  TextEditingController tanggalSelesai = TextEditingController();
  List perusahaan = ["PT Wahana Rizky Gumilang", "PT Wahana Meditek Indonesia"];
  List cabang = ["Surabaya", "Malang"];
  List metodeBayar = ["Cash", "Tunai"];
  List kategori = ["Entertain", "Rapat", "Teknis"];

  final controllerInput = TextEditingController();
  final listChips = <String>[];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
        String convertedDateTime =
            "${currentDate.year.toString()}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')} ";

        tanggalMulai.text = convertedDateTime;
      });
  }

  Future<void> _endDate(BuildContext context) async {
    final DateTime pickedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != endDate)
      setState(() {
        endDate = pickedDate;
        String convertedDateTime =
            "${endDate.year.toString()}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')} ";

        tanggalSelesai.text = convertedDateTime;
      });
  }

  _CreatePengajuanState(
      {this.judul, this.buttonColor, this.appBarColor, this.rincianBiaya});

  sendData(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DetailsPengajuan(
                  // mainColor: Colors.blue, judul: "Detail Pengajuan Kasbon",
                  // tujuanHolder: tujuan.text,
                  // cabangHolder: showCabang,
                  // jenisPencairanHolder: showMetodeBayar,
                  // kategoriHolder: showKategori,
                  // perusahaanHolder: showPerusahaan,
                  // tanggalMulaiHolder: tanggalMulai.text,
                  // tanggalSelesaiHolder: tanggalSelesai.text,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: appBarColor,
          title: Text(judul,
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.cancel_outlined),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
        ),
        body: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        "Detail Pengajuan",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          labelText: 'Tujuan',
                        ),
                        onTap: () {},
                        controller: tujuan,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blueGrey)),
                          child: DropdownButton(
                            hint: Text("Kategori"),
                            value: showKategori,
                            items: kategori.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                showKategori = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.event_note),
                                  labelText: 'Tanggal Mulai',
                                ),
                                onTap: () {
                                  setState(() {
                                    _selectDate(context);
                                  });
                                },
                                controller: tanggalMulai,
                              ),
                            ),
                          ),
                          Flexible(
                              child: Container(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Padding(
                              padding: EdgeInsets.all(5),
                              child: TextField(
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(color: Colors.black45),
                                  errorStyle:
                                      TextStyle(color: Colors.redAccent),
                                  border: OutlineInputBorder(),
                                  suffixIcon: Icon(Icons.event_note),
                                  labelText: 'Tanggal Selesai',
                                ),
                                onTap: () {
                                  setState(() {
                                    _endDate(context);
                                  });
                                },
                                controller: tanggalSelesai,
                              ),
                            ),
                          ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blueGrey)),
                          child: DropdownButton(
                            hint: Text("Perusahaan"),
                            value: showPerusahaan,
                            items: perusahaan.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                showPerusahaan = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blueGrey)),
                          child: DropdownButton(
                            hint: Text("Cabang"),
                            value: showCabang,
                            items: cabang.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                showCabang = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blueGrey)),
                          child: DropdownButton(
                            hint: Text("Jenis Pencairan"),
                            value: showMetodeBayar,
                            items: metodeBayar.map((value) {
                              return DropdownMenuItem(
                                child: Text(value),
                                value: value,
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                showMetodeBayar = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Info Tambahan",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Perjalanan Dinas",
                                  style: TextStyle(
                                      color: Color(0xFFA8A8A8),
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          labelText: 'Lokasi Tujuan',
                        ),
                        onTap: () {},
                        //controller: tanggalSelesai,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextField(
                        maxLines: 3,

                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          labelText: 'Agenda',
                        ),
                        onTap: () {},
                        //controller: tanggalSelesai,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        "Pelaksana",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextField(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              labelText: 'Input Pelaksana',
                            ),
                            controller: controllerInput,
                            onSubmitted: (value) {
                              setState(() {
                                controllerInput.text = '';
                                listChips.add(value);
                              });
                            },
                            // decoration: InputDecoration(
                            //   hintText: 'Tambahkan Pelaksana',
                            //   isDense: true,
                            // ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          Wrap(
                            children: listChips.map((e) {
                              return InputChip(
                                avatar: CircleAvatar(
                                  child: Icon(Icons.account_circle),
                                ),
                                label: Text(e),
                                onDeleted: () =>
                                    setState(() => listChips.remove(e)),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11)),
                          color: buttonColor,
                          onPressed: () {},
                          child: Text("Tambahkan Pelaksana +",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                      child: Text(
                        "Rincian Biaya",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Perawatan",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w600)),
                                IconButton(
                                    icon: Icon(Icons.file_present),
                                    onPressed: () {})
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Sisir kucing extra smooth",
                                    maxLines: 3,
                                    style: TextStyle(fontFamily: "Montserrat")),
                                Text(
                                  "Rp 134.000,00",
                                  style: TextStyle(fontFamily: "Montserrat"),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11)),
                          color: buttonColor,
                          onPressed: () {
                            // showDialog(
                            //     context: context,
                            //     builder: (BuildContext context) {
                            //       return rincianBiaya;
                            //     });
                            _showDialog();
                          },
                          child: Text("Tambahkan Rincian Biaya +",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: Text(
                            "Total Biaya",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Text(
                            "Rp 256.000,00",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xFF555555)),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextField(
                        maxLines: 3,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          labelText: 'Catatan',
                        ),
                        onTap: () {},
                        //controller: tanggalSelesai,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                      width: 400,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(0),
                        elevation: 10,
                        onPressed: () {
                          sendData(context);
                        },
                        color: Colors.blue,
                        child: Container(
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  Color(0xFF358BFC),
                                  Color(0xFF3AE3CE)
                                ])),
                            child: Container(
                              constraints:
                                  BoxConstraints(maxWidth: 400, minHeight: 50),
                              alignment: Alignment.center,
                              child: Text(
                                "Kirim Kasbon",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "Montserrat"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Center(
                    //   child: Container(
                    //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    //     child: Ink(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color: buttonColor),
                    //       child: Container(
                    //         constraints:
                    //             BoxConstraints(maxWidth: 400, minHeight: 50),
                    //         alignment: Alignment.center,
                    //         child: Text(
                    //           "Kirim kasbon",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 20,
                    //               fontWeight: FontWeight.w600,
                    //               fontFamily: "Montserrat"),
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
