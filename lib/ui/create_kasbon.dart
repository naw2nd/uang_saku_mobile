import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';

class CreateKasbon extends StatefulWidget {
  @override
  _CreateKasbonState createState() => _CreateKasbonState();
}

class _CreateKasbonState extends State<CreateKasbon> {
  String showPerusahaan;
  String showCabang;
  String showMetodeBayar;
  DateTime currentDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController tujuan = TextEditingController();
  TextEditingController tanggalMulai = TextEditingController();
  TextEditingController tanggalSelesai = TextEditingController();
  List perusahaan = ["PT Wahana Rizky Gumilang", "PT Wahana Meditek Indonesia"];
  List cabang = ["Surabaya", "Malang"];
  List MetodeBayar = ["Cash", "Tunai"];

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.blue,
          title: Text("Kasbon",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.cancel_outlined), onPressed: () {})
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
                        //controller: tanggalSelesai,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                      child: TextField(
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.black45),
                          errorStyle: TextStyle(color: Colors.redAccent),
                          border: OutlineInputBorder(),
                          labelText: 'Kategori',
                        ),
                        onTap: () {},
                        //controller: tanggalSelesai,
                      ),
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[Text("kasdk"), Text("kasdk")],
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                          width: 300,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
                          width: 300,
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blueGrey)),
                          child: DropdownButton(
                            hint: Text("Jenis Pencairan"),
                            value: showMetodeBayar,
                            items: MetodeBayar.map((value) {
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
                          color: Colors.blue,
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
                                Text("Sisir kucing extra smooth",maxLines: 3,
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
                          color: Colors.blue,
                          onPressed: () {},
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
                    Center(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Ink(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue),
                          child: Container(
                            constraints:
                                BoxConstraints(maxWidth: 400, minHeight: 50),
                            alignment: Alignment.center,
                            child: Text(
                              "Kirim kasbon",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Montserrat"),
                            ),
                          ),
                        ),
                      ),
                    )
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
