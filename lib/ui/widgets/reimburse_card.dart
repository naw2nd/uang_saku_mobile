import 'package:flutter/material.dart';
import 'package:uang_saku/ui/reimburse_approval.dart';
import 'package:uang_saku/ui/widgets/card_list.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';

class ReimburseCard extends StatefulWidget {
  @override
  _ReimburseCardState createState() => _ReimburseCardState();
}

class _ReimburseCardState extends State<ReimburseCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ReimburseApproval
            ();
          }));
        },
        child: CardList(
          judul: "Reimburse disetjui korcab",
        ));
  }
}
