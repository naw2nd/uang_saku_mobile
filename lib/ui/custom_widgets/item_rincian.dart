
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'detail_rincian_biaya.dart';
import 'package:intl/intl.dart';

class ItemRincian extends StatelessWidget {
  final rincianBiaya;
  final String jenisPengajuan;
  final bool isGet;
  ItemRincian({this.rincianBiaya, this.jenisPengajuan, this.isGet});
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
                  jenisPengajuan: jenisPengajuan,
                  rincianBiaya: rincianBiaya, isGet: isGet,
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
                  Text(rincianBiaya.kategoriBiaya.namaKategoriBiaya,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.w600)),
                  (rincianBiaya.images.isNotEmpty)
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 6,
                    child: Text(rincianBiaya.namaItem,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat()),
                  ),
                  Flexible(
                      flex: 4,
                      child: Text(
                          "Rp" +
                              NumberFormat.currency(locale: "eu", symbol: "")
                                  .format(rincianBiaya.total),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat()))
                ])
          ])),
    );
  }
}
