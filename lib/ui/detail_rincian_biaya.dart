import 'dart:io';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/model/rincian_realisasi.dart';

class DetailRincianBiaya extends StatefulWidget {
  final String jenisPengajuan;
  final RincianRealisasi rincianBiaya;
  DetailRincianBiaya({this.jenisPengajuan, this.rincianBiaya});
  @override
  _DetailRincianBiayaState createState() => _DetailRincianBiayaState();
}

class _DetailRincianBiayaState extends State<DetailRincianBiaya> {
  // List<Image> images;
  @override
  Widget build(BuildContext context) {
    List<Widget> list = new List<Widget>();
    widget.rincianBiaya.images.forEach((element) {
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
                    child: Image.memory(base64Decode(element.image)),
                  )));
            }),
        child: Container(
          width: (MediaQuery.of(context).size.width - 120) / 2,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              child: Image.memory(base64Decode(element.image)),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ));
    });

    return Container(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        child: SingleChildScrollView(
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
                      icon:
                          Icon(Icons.cancel_outlined, color: Color(0xFF555555)),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                )
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nama Biaya", style: GoogleFonts.montserrat()),
                  Text(widget.rincianBiaya.namaItem,
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kategori Biaya", style: GoogleFonts.montserrat()),
                  Text(widget.rincianBiaya.kategoriBiaya.namaKategoriBiaya,
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Harga Total", style: GoogleFonts.montserrat()),
                  Text(
                      "Rp" +
                          NumberFormat.currency(locale: "eu", symbol: "")
                              .format(widget.rincianBiaya.total),
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500))
                ],
              ),
            ),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: list,
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Flexible(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(15),
            //           child: image == null
            //               ? Center(
            //                   child: Text(
            //                     "Tidak ada gambar",
            //                     style: TextStyle(
            //                       fontFamily: "Montserrat",
            //                     ),
            //                   ),
            //                 )
            //               : Image.file(image),
            //         ),
            //       ),
            //     ),
            //     Flexible(
            //       child: Padding(
            //         padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            //         child: ClipRRect(
            //           borderRadius: BorderRadius.circular(15),
            //           child: image == null
            //               ? Center(
            //                   child: Text("Tidak ada gambar",
            //                       style: TextStyle(
            //                         fontFamily: "Montserrat",
            //                       )),
            //                 )
            //               : Image.file(image),
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Catatan", style: GoogleFonts.montserrat()),
                  Text(
                      (widget.rincianBiaya.keterangan != "")
                          ? widget.rincianBiaya.keterangan
                          : "-",
                      style:
                          GoogleFonts.montserrat(fontWeight: FontWeight.w500))
                ],
              ),
            ),
          ],
        )));
  }
}