import 'package:flutter/material.dart';

import '../details_pengajuan_kasbon.dart';

class ReimburseApproval extends StatefulWidget {
  @override
  _ReimburseApprovalState createState() => _ReimburseApprovalState();
}

class _ReimburseApprovalState extends State<ReimburseApproval> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: DetailsPengajuanKasbon(
              // judul: "Detail Pengajuan Reimburse",
              // mainColor: Color(0xFF3AE3CE),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                RaisedButton(
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
                  color: Colors.red,
                  onPressed: () {},
                  child: Text(
                    "Tolak",
                    style: TextStyle(
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: Colors.white),
                  ),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)),
                  color: Color(0xFF2B4D66),
                  onPressed: () {
                    setState(() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                // return NoteDialog();
              });
                    });
                  },
                  child: Text("Approval",
          style: TextStyle(
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600,
              color: Colors.white)),
                )
              ],
            )
        ],
      )),
    );
  }
}