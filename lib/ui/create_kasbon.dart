import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/create_form_pengajuan.dart';
import 'package:uang_saku/ui/widgets/rincian_biaya.dart';

class CreateKasbon extends StatefulWidget {
  @override
  _CreateKasbonState createState() => _CreateKasbonState();
}

class _CreateKasbonState extends State<CreateKasbon> {

  
  @override
  Widget build(BuildContext context) {
    return CreatePengajuan(
      judul: "Form Pengajuan Kasbon",
      buttonColor: Color(0xFF358BFC),
      appBarColor: Color(0xFF358BFC),
      rincianBiaya: RincianBiaya(buttonColor: Color(0xFF358BFC),judul: "Rincian Kasbon",),
    );
  }
}
