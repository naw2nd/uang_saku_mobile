import 'package:flutter/material.dart';
import 'package:uang_saku/ui/create_laporan.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';

class LaporanCard extends StatefulWidget {
  @override
  _LaporanCardState createState() => _LaporanCardState();
}

class _LaporanCardState extends State<LaporanCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CreateLaporan();
          }));
        },
        child: CardList());
  }
}
