//import 'dart:html';
import 'dart:io';
import 'dart:convert';
import 'package:intl/intl.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/event/create_pengajuan_event.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/state/create_pengajuan_state.dart';
import 'package:uang_saku/model/kategori_biaya.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/custom_widgets/custom_text_form_field.dart';

class FormRincianBiaya extends StatefulWidget {
  final String jenisPengajuan;
  FormRincianBiaya({this.jenisPengajuan});
  @override
  _FormRincianBiayaState createState() => _FormRincianBiayaState();
}

class _FormRincianBiayaState extends State<FormRincianBiaya> {
  var _colorTheme;
  List<File> _images = new List<File>();
  TextEditingController _namaBiayaCtrl = TextEditingController();
  TextEditingController _biayaCtrl = TextEditingController();
  TextEditingController _catatanCtrl = TextEditingController();
  int _totalBiaya = 0;
  KategoriBiaya _selectedKategoriBiaya;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    context.read<CreateRincianBiayaBloc>().add(InitRincianEvent());

    if (widget.jenisPengajuan == "Reimburse")
      _colorTheme = Color(0xFF3AE3CE);
    else if (widget.jenisPengajuan == "Kasbon")
      _colorTheme = Color(0xFF358BFC);
    else
      _colorTheme = Color(0xFF2B4D66);

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
        child: BlocBuilder<CreateRincianBiayaBloc, BaseState>(
          builder: (_, state) {
            if (state is CreateRincianBiayaState)
              return SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                icon: Icon(Icons.cancel_outlined,
                                    color: Color(0xFF555555)),
                                onPressed: () {
                                  Navigator.pop(context);
                                }),
                          )
                        ],
                      ),
                      CustomTextFormField(
                        label: "Nama Biaya",
                        validation: ["required"],
                        controller: _namaBiayaCtrl,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7),
                        child: DropdownButtonFormField(
                          decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(13),
                              labelText: "Kategori Biaya",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          value: _selectedKategoriBiaya,
                          validator: (value) => (value == null)
                              ? "Kategori Biaya harus diisi"
                              : null,
                          isDense: true,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedKategoriBiaya = newValue;
                            });
                          },
                          items: state.listKategoriBiaya.map((value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value.namaKategoriBiaya),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7, bottom: 7),
                        child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _biayaCtrl,
                            validator: (value) {
                              if (value == "") return "Harga biaya harus diisi";
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _totalBiaya = int.parse(value);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: "Harga Biaya",
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            )),
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
                            "Rp" +
                                NumberFormat.currency(locale: "eu", symbol: "")
                                    .format(_totalBiaya),
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF555555)),
                          )
                        ],
                      ),
                      CustomTextFormField(
                          label: "Catatan", validation: [], lines: 3),
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
                              List<Image64> listImage64 = List<Image64>();
                              _images.forEach((element) {
                                listImage64
                                    .add(Image64(image: fileToBase64(element)));
                              });
                              RincianRealisasi rincianRealisasi =
                                  RincianRealisasi(
                                      idKategoriBiaya: _selectedKategoriBiaya
                                          .idKategoriBiaya,
                                      namaItem: _namaBiayaCtrl.text,
                                      keterangan: _catatanCtrl.text,
                                      kategoriBiaya: _selectedKategoriBiaya,
                                      images: listImage64,
                                      total: _totalBiaya);
                              BlocProvider.of<CreateRincianBiayaBloc>(context)
                                  .add(AddRincianBiayaEvent(
                                      rincianRealisasi: rincianRealisasi));
                              Navigator.pop(context);
                            }
                          },
                          child: Container(
                            child: Ink(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _colorTheme),
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
              );
            else
              return Wrap(
                  alignment: WrapAlignment.center,
                  children: [CircularProgressIndicator()]);
          },
        ));
  }

  String fileToBase64(File image) {
    List<int> imageBytes = image.readAsBytesSync();
    return base64Encode(imageBytes);
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
