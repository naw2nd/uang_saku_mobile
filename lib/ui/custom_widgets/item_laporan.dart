import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/ui/custom_widgets/detail_rincian_laporan.dart';

import 'detail_rincian_biaya.dart';
import 'package:intl/intl.dart';

class ItemLaporan extends StatelessWidget {
  final rincianLaporan;
  final String jenisPengajuan;
  final bool isGet;
  ItemLaporan({this.rincianLaporan, this.jenisPengajuan, this.isGet});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: DetailRincianLaporan(
                  jenisPengajuan: jenisPengajuan,
                  rincianLaporan: rincianLaporan,
                  isGet: (isGet != null) ? isGet : false,
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
                  Text(rincianLaporan.kategoriBiaya.namaKategoriBiaya,
                      style: GoogleFonts.montserrat(
                          color: Color(0xFF555555),
                          fontWeight: FontWeight.w600)),
                  (rincianLaporan.images.isNotEmpty)
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
                    child: Text(rincianLaporan.namaItem,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.montserrat()),
                  ),
                  Flexible(
                      flex: 4,
                      child: Text(
                          "Rp" +
                              NumberFormat.currency(locale: "eu", symbol: "")
                                  .format(rincianLaporan.total),
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat()))
                ])
          ])),
    )

        // showDialog(
        //     context: context,
        //     barrierColor: Colors.black45,
        //     builder: (BuildContext context) {
        //       return Dialog(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(10)),
        //           child: DetailRincianBiaya(
        //             jenisPengajuan: jenisPengajuan,
        //             rincianBiaya: rincianBiaya,
        //             isGet: (isGet != null) ? isGet : false,
        //           ));
        //     }),

        ;
  }
}
