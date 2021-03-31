//import 'dart:html';
import 'dart:io';
import 'dart:convert';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uang_saku/ui/custom_widgets/custom_dropdown_form_field.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';

class RincianBiaya extends StatefulWidget {
  final String jenisPengajuan;
  RincianBiaya({this.jenisPengajuan});
  @override
  _RincianBiayaState createState() => _RincianBiayaState();
}

class _RincianBiayaState extends State<RincianBiaya> {
  var colorTheme;
  List<File> _images = new List<File>();

  TextEditingController namaBiaya = TextEditingController();
  TextEditingController jumlah = TextEditingController();
  TextEditingController hargaSatuan = TextEditingController();
  TextEditingController catatan = TextEditingController();
  List<String> kategoriBiaya = ["Pemeliharaan", "Entertain"];
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

  getImage(String imageSource) async {
    PickedFile image;
    print("mulai");
    if (imageSource == "Gallery")
      image = await ImagePicker()
          .getImage(source: ImageSource.gallery, imageQuality: 20);
    else
      image = await ImagePicker()
          .getImage(source: ImageSource.camera, imageQuality: 20);
    print("bisa");
    setState(() {
      if (image != null) {
        _images.add(File(image.path));
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    _images.forEach((element) {
      list.add(GestureDetector(
        onTap: () => showDialog(
            context: context,
            barrierColor: Colors.black45,
            builder: (BuildContext context) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Container(
                      child: ClipRRect(
                    child: Image.file(element),
                  )));
            }),
        child: Stack(alignment: AlignmentDirectional.topEnd, children: [
          Container(
            width: (MediaQuery.of(context).size.width - 120) / 2,
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FittedBox(
                child: Image.file(element),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
                color: Colors.black54),
            child: IconButton(
              icon: Icon(Icons.delete, color: Colors.white70),
              onPressed: () {
                setState(() {
                  _images.remove(element);
                });
              },
              padding: EdgeInsets.zero,
            ),
          )
        ]),
      ));
    });

    return Container(
      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rincian Biaya " + widget.jenisPengajuan,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF555555)),
                  ),
                  Container(
                    width: 25,
                    height: 25,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                        icon: Icon(Icons.cancel, color: Color(0xFF555555)),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  )
                ],
              ),
              CustomTextFormField(
                label: "Nama Biaya",
                validation: ["required"],
                controller: namaBiaya,
              ),
              CustomDropdownFormField(
                label: "Kategori Biaya",
                items: kategoriBiaya,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      flex: 15,
                      child: CustomTextFormField(
                        label: "Jumlah",
                        controller: jumlah,
                        validation: ["required"],
                      )),
                  Flexible(flex: 1, child: Container()),
                  Flexible(
                      flex: 15,
                      child: CustomTextFormField(
                        label: "Harga Satuan",
                        controller: hargaSatuan,
                        validation: ["required"],
                      )),
                ],
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: list,
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: DottedBorder(
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
                        onPressed: () => _showPicker(context),
                        child: Ink(
                          color: Colors.white,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "Lampirkan Gambar / Foto",
                              style: GoogleFonts.montserrat(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total Biaya",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF555555)),
                  ),
                  Text(
                    "Rp256.000,00",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF555555)),
                  )
                ],
              ),
              CustomTextFormField(label: "Catatan", validation: [], lines: 3),
              Container(
                height: 45,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.all(0),
                  elevation: 0,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      print("validated");
                    }
                  },
                  child: Container(
                    child: Ink(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: colorTheme),
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Tambahkan",
                            style: GoogleFonts.montserrat(
                                color: Colors.white,
                                fontSize: 20,
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: [
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Gallery'),
                      onTap: () {
                        getImage("Gallery");
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Camera'),
                    onTap: () {
                      getImage("Camera");
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}