import 'package:flutter/material.dart';
import 'package:uang_saku/ui/kasbon_approval.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';

class KasbonCard extends StatefulWidget {
  @override
  _KasbonCardState createState() => _KasbonCardState();
}

class _KasbonCardState extends State<KasbonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailsPengajuan(
              // mainColor: Colors.blue,
              // judul: "Detail Pengajuan Kasbon",
              // tujuanHolder: "",
              // cabangHolder: "",
              // jenisPencairanHolder: "",
              // kategoriHolder: "",
              // perusahaanHolder: "",
              // tanggalMulaiHolder: "",
              // tanggalSelesaiHolder: "",
            );
          }));
        },
        child: CardList(
          judul: "Kasbon telah disetujui",
        ));
  }
}
