import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/create_rincian_biaya_bloc.dart';
import 'package:uang_saku/bloc/event/create_pengajuan_event.dart';

class DetailRincianLaporan extends StatefulWidget {
  final String jenisPengajuan;
  final rincianLaporan;
  final bool isGet;
  DetailRincianLaporan({this.jenisPengajuan, this.rincianLaporan, this.isGet});
  @override
  _DetailRincianLaporanState createState() => _DetailRincianLaporanState();
}

class _DetailRincianLaporanState extends State<DetailRincianLaporan> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [];
    widget.rincianLaporan.images.forEach((element) {
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
                    child: (widget.isGet)
                        ? Image.network(element.image)
                        : Image.memory(base64Decode(element.image)),
                  )));
            }),
        child: Container(
          width: (MediaQuery.of(context).size.width - 120) / 2,
          height: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FittedBox(
              child: (widget.isGet)
                  ? Image.network(element.image)
                  : Image.memory(base64Decode(element.image)),
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
                  "Rincian  " + widget.jenisPengajuan,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Color(0xFF555555)),
                ),
                (widget.isGet)
                    ? Container()
                    : Container(
                        width: 20,
                        height: 20,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.delete_rounded,
                                color: Color(0xFF555555)),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 90),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              15, 10, 15, 10),
                                          child: Wrap(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 7),
                                                child: Text(
                                                    "Apakah anda yakin untuk menghapus Rincian Biaya " +
                                                        widget.jenisPengajuan +
                                                        " ini ?",
                                                    textAlign: TextAlign.center,
                                                    style: GoogleFonts
                                                        .montserrat()),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                                        BlocProvider.of<
                                                                    CreateRincianBiayaBloc>(
                                                                context)
                                                            .add(DeleteRincianBiayaEvent(
                                                                rincianBiaya: widget
                                                                    .rincianLaporan));
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Ya",
                                                          style: GoogleFonts
                                                              .montserrat())),
                                                  TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text("Tidak",
                                                          style: GoogleFonts
                                                              .montserrat()))
                                                ],
                                              ),
                                            ],
                                          ),
                                        ));
                                  });
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
                  Text(widget.rincianLaporan.namaItem,
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
                  Text(widget.rincianLaporan.kategoriBiaya.namaKategoriBiaya,
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
                    (widget.jenisPengajuan == "Laporan")
                        ? "Rp" +
                            NumberFormat.currency(locale: "eu", symbol: "")
                                .format(widget.rincianLaporan.total)
                        : "",
                    // Text(
                    //     ((widget.jenisPengajuan == "Kasbon")
                    //             ? "Rp" +
                    //                 NumberFormat.currency(
                    //                         locale: "eu", symbol: "")
                    //                     .format(
                    //                         widget.rincianLaporan.hargaSatuan) +
                    //                 "x @" +
                    //                 widget.rincianLaporan.jumlahUnit.toString() +
                    //                 " = "
                    //             : "") +
                    //         "Rp" +
                    //         NumberFormat.currency(locale: "eu", symbol: "")
                    //             .format(widget.rincianLaporan.total),
                    //     style:
                    //         GoogleFonts.montserrat(fontWeight: FontWeight.w500))
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Lampiran", style: GoogleFonts.montserrat()),
                    // Wrap(
                    //   spacing: 10,
                    //   runSpacing: 10,
                    //   children: list,
                    // ),
                  ],
                )),
            Container(
              margin: EdgeInsets.only(bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Catatan", style: GoogleFonts.montserrat()),
                  Text(
                      (widget.rincianLaporan.keterangan != null)
                          ? widget.rincianLaporan.keterangan
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
