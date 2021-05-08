import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/model/kasbon.dart';

import '../form_edit_rincian_biaya.dart';
import 'package:intl/intl.dart';

class ItemPengajuan extends StatelessWidget {
  final Kasbon kasbon;
  final rincianPengajuan;
  final String jenisPengajuan;
  final bool isGet;
  ItemPengajuan(
      {this.rincianPengajuan, this.jenisPengajuan, this.isGet, this.kasbon});
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
                child: FormEditRincianBiaya(
                  jenisPengajuan: "Kasbon",
                  kasbon: kasbon,
                  rincianPengajuan: rincianPengajuan,
                ));
            // return Dialog(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10)),
            //     child: DetailRincianBiaya(
            //       jenisPengajuan: jenisPengajuan,
            //       rincianBiaya: rincianPengajuan,
            //       isGet: (isGet != null) ? isGet : false,
            //     ));
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
                  Text(rincianPengajuan.kategoriBiaya.namaKategoriBiaya,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.w600)),
                  (rincianPengajuan.images.isNotEmpty)
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
                    child: Text(rincianPengajuan.namaItem,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat()),
                  ),
                  Flexible(
                      flex: 4,
                      child: Text(
                          "Rp" +
                              NumberFormat.currency(locale: "eu", symbol: "")
                                  .format(rincianPengajuan.total),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat()))
                ])
          ])),
    );
  }
}
