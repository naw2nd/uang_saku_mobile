import 'package:flutter/material.dart';

import 'card_list.dart';

class NotifikasiPage extends StatefulWidget {
  @override
  _NotifikasiPageState createState() => _NotifikasiPageState();
}

class _NotifikasiPageState extends State<NotifikasiPage> {
  // final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Notifikasi",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return DeleteDialog();
                        });
                  },
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            margin: EdgeInsets.fromLTRB(0, 80, 0, 0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            child: ListView(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      child: Text(
                        "Minggu ini",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            color: Color(0xFF555555)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Tandai sudah dibaca",
                              style: TextStyle(
                                  color: Color(0xFFA8A8A8),
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12))),
                    )
                  ],
                ),
                KasbonCard(),
                //LaporanCard()

                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                //   child: Card(
                //     color: Colors.white,
                //     elevation: 5,
                //     child: Container(
                //       padding: EdgeInsets.all(10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Icon(Icons.file_present,
                //               color: Colors.blue[800], size: 50),
                //           Flexible(
                //             flex: 1,
                //             child: Container(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: <Widget>[
                //                   Text("Pengajuan kasbon dicairkan",
                //                       style: TextStyle(
                //                           fontFamily: "Montserrat",
                //                           fontWeight: FontWeight.w600,
                //                           fontSize: 12)),
                //                   Text("Perjalanan dengan client",
                //                       style: TextStyle(
                //                           fontFamily: "Montserrat",
                //                           fontWeight: FontWeight.w600,
                //                           color: Colors.grey[500],
                //                           fontSize: 12))
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Text("Senin, 12 April",
                //               style: TextStyle(
                //                   fontFamily: "Montserrat",
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 10,
                //                   color: Colors.blue[800]))
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   padding: EdgeInsets.fromLTRB(10, 0, 10, 5),
                //   child: Card(
                //     color: Colors.white,
                //     elevation: 5,
                //     child: Container(
                //       padding: EdgeInsets.all(10),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: <Widget>[
                //           Icon(Icons.file_present,
                //               color: Color(0xFF3AE3CE), size: 50),
                //           Flexible(
                //             flex: 1,
                //             child: Container(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: <Widget>[
                //                   Text("Pengajuan reimburse selesai",
                //                       style: TextStyle(
                //                           fontFamily: "Montserrat",
                //                           fontWeight: FontWeight.w600,
                //                           fontSize: 12)),
                //                   Text("Perjalanan dengan client",
                //                       style: TextStyle(
                //                           fontFamily: "Montserrat",
                //                           fontWeight: FontWeight.w600,
                //                           color: Colors.grey[500],
                //                           fontSize: 12))
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Text("Senin, 12 April",
                //               style: TextStyle(
                //                   fontFamily: "Montserrat",
                //                   fontWeight: FontWeight.w600,
                //                   fontSize: 10,
                //                   color: Colors.blue[800]))
                //         ],
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
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
