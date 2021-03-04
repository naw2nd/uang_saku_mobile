import 'package:flutter/material.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';

class CardList extends StatefulWidget {
  String judul = "Kasbon disetujui korcab";

  CardList({this.judul});
  @override
  _CardListState createState() => _CardListState(judul: judul);
}

class _CardListState extends State<CardList> {
  String judul = "Kasbon disetujui korcab";

  _CardListState({this.judul});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.check_box_rounded, color: Colors.blue[800], size: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(judul,
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 12,
                          fontWeight: FontWeight.w600)),
                  Text("Perjalanan dengan client",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[500],
                          fontSize: 12))
                ],
              ),
              Text("Senin, 12 April",
                  style: TextStyle(
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      color: Colors.blue[800]))
            ],
          ),
        ),
      ),
    );
  }
}
