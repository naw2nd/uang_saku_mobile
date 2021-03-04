//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RincianBiaya extends StatefulWidget {
  var buttonColor = Color(0xFF358BFC);
  String judul = "Rincian Biaya Kasbon";

  RincianBiaya({this.buttonColor, this.judul});

  @override
  _RincianBiayaState createState() =>
      _RincianBiayaState(buttonColor: buttonColor, judul: judul);
}

class _RincianBiayaState extends State<RincianBiaya> {
  File _image;
  final picker = ImagePicker();

  Future getCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("Tidak ada gambar");
      }
    });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  var buttonColor = Color(0xFF358BFC);
  String judul = "Rincian Biaya Kasbon";
  TextEditingController namaBiaya_tf = TextEditingController();
  TextEditingController KategoriBiaya_tf = TextEditingController();
  TextEditingController jumlah_tf = TextEditingController();
  TextEditingController hargaSatuan_tf = TextEditingController();
  TextEditingController catatan_tf = TextEditingController();
  String showKategoriBiaya;
  List kategoriBiaya = ["Pemeliharaan", "Entertain"];

  _RincianBiayaState({this.buttonColor, this.judul});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: <Widget>[
            Dialog(
              child: Column(
                children: <Widget>[
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            judul,
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF555555)),
                          ),
                        ),
                        IconButton(
                            icon: Icon(Icons.cancel, color: Color(0xFF555555)),
                            onPressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    child: TextField(
                      decoration: const InputDecoration(
                        hintStyle: TextStyle(color: Colors.black45),
                        errorStyle: TextStyle(color: Colors.redAccent),
                        border: OutlineInputBorder(),
                        labelText: 'Nama Biaya',
                      ),
                      onTap: () {},
                      //controller: tanggalSelesai,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                      child: Container(
                        width: 240,
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey)),
                        child: DropdownButton(
                          hint: Text("Kategori Biaya"),
                          value: showKategoriBiaya,
                          items: kategoriBiaya.map((value) {
                            return DropdownMenuItem(
                              child: Text(value),
                              value: value,
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              showKategoriBiaya = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              labelText: 'Jumlah',
                            ),
                            onTap: () {},
                            //controller: tanggalSelesai,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                          child: TextField(
                            decoration: const InputDecoration(
                              hintStyle: TextStyle(color: Colors.black45),
                              errorStyle: TextStyle(color: Colors.redAccent),
                              border: OutlineInputBorder(),
                              labelText: 'Harga Satuan',
                            ),
                            onTap: () {},
                            //controller: tanggalSelesai,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: _image == null
                                ? Center(
                                    child: Text(
                                      "Tidak ada gambar",
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                      ),
                                    ),
                                  )
                                : Image.file(_image),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: _image == null
                                ? Center(
                                    child: Text("Tidak ada gambar",
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                        )),
                                  )
                                : Image.file(_image),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: RaisedButton(
                              color: buttonColor,
                              onPressed: () {
                                getCamera();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.camera_alt_rounded,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    Text("Camera",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))
                                  ],
                                ),
                              )),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: RaisedButton(
                              color: buttonColor,
                              onPressed: () {
                                getImage();
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: Column(
                                  children: <Widget>[
                                    Icon(
                                      Icons.photo,
                                      size: 40,
                                      color: Colors.white,
                                    ),
                                    Text("Gallery",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white))
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  // Center(
                  //   child: Container(
                  //     padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  //     child: RaisedButton(
                  //       shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(11)),
                  //       color: buttonColor,
                  //       onPressed: () {
                  //         getCamera();
                  //       },
                  //       child: Text("Lampirkan foto / gambar +",
                  //           style: TextStyle(
                  //               fontFamily: "Montserrat",
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w600)),
                  //     ),
                  //   ),
                  // ),
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
                            color: buttonColor),
                        child: Container(
                          constraints:
                              BoxConstraints(maxWidth: 400, minHeight: 50),
                          alignment: Alignment.center,
                          child: Text(
                            "Tambahkan",
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
          ],
        ),
      ),
    );
  }
}
