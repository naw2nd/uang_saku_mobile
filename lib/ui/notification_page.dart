import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:uang_saku/model/notifikasi.dart';
import 'package:uang_saku/repository/db_helper.dart';

import 'belum kepakek/card_list.dart';
import 'custom_widgets/custom_card.dart';
import 'package:intl/intl.dart';

Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) async {
  print("background");
}

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<Notifikasi> notifikasi = [];
  DbHelper dbHelper = DbHelper();

  @override
  Widget build(BuildContext context) {
    dbHelper.getContactList().then((value) => setState(() {
          notifikasi = value;
        }));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          ),
          title: Text(
            "Notifikasi",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700, fontSize: 25),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  dbHelper.drop().then((value) => setState(() {
                        notifikasi.clear();
                      }));
                })
          ],
          bottom: PreferredSize(
            preferredSize: Size(0, 16),
            child: Container(
              height: 16,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
            ),
          ),
        ),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
            child: Text(
              "Minggu ini",
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Color(0xFF555555)),
            ),
          ),
          // Container(
          //     padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
          //     child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Text(
          //             "Minggu ini",
          //             style: GoogleFonts.montserrat(
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 18,
          //                 color: Color(0xFF555555)),
          //           ),
          //           TextButton(
          //               onPressed: () {},
          //               child: Text("", //"Tandai sudah dibaca",
          //                   style: GoogleFonts.montserrat(
          //                       color: Color(0xFFA8A8A8),
          //                       fontWeight: FontWeight.w600,
          //                       fontSize: 12))),
          //         ])),
          Expanded(
            child: ListView.builder(
                itemCount: notifikasi.length,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: GestureDetector(
                        onTap: () {},
                        child: CustomCard(
                            container: Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    flex: 2,
                                    child: Icon(
                                      Icons.message_outlined,
                                      color: Color(0xFF358BFC),
                                      size: 25,
                                    )),
                                Flexible(
                                  flex: 15,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                          flex: 10,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 5),
                                                  child: Text(
                                                    notifikasi[i].title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: GoogleFonts.roboto(
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 14),
                                                  )),
                                              Text(
                                                notifikasi[i].message,
                                                overflow: TextOverflow.ellipsis,
                                              )
                                            ],
                                          )),
                                      Flexible(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 5),
                                                child: Text(
                                                  notifikasi[i].day,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xFF6f96b0)),
                                                ),
                                              ),
                                              Text(
                                                notifikasi[i].time,
                                                overflow: TextOverflow.ellipsis,
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w500,
                                                    color: Color(0xFF58b84b)),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                )
                              ]),
                        )),
                      ));
                }),
          )
        ]));
  }
}

class DeleteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      height: MediaQuery.of(context).size.width * 0.5,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Apakah anda yakin ingin menghapus semua notifikasi?",
              style: TextStyle(
                  fontFamily: "Montserrat", fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Batal",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Color(0xFF358BFC),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
