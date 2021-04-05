import 'package:flutter/material.dart';
import 'package:uang_saku/ui/list_approval.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';


class KasbonApproval extends StatefulWidget {
  @override
  _KasbonApprovalState createState() => _KasbonApprovalState();
}

class _KasbonApprovalState extends State<KasbonApproval> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: DetailsPengajuan(
              // judul: "Detail Pengajuan Kasbon",
              // mainColor: Colors.blue,
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
                return NoteDialog();
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
