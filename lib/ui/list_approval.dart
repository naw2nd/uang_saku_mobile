import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/list_approval._bloc.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/filter_approval.dart';

import 'custom_widgets/custom_card.dart';
import 'package:intl/intl.dart';

class ListApproval extends StatefulWidget {
  final int idRoleApproval;
  final String namaRoleApproval;
  ListApproval({this.idRoleApproval, this.namaRoleApproval});
  @override
  _ListApprovalState createState() => _ListApprovalState();
}

class _ListApprovalState extends State<ListApproval> {
  @override
  void initState() {
    print("init event");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFF2B4D66),
              centerTitle: true,
              title: Text(
                "Approval " + widget.namaRoleApproval,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700, fontSize: 20),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.filter_list),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return FilterApproval();
                          });
                    })
              ],
              bottom: PreferredSize(
                  preferredSize: Size(50, 50),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        color: Colors.white,
                        height: 50,
                        child: TabBar(
                          labelStyle: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600, fontSize: 18),
                          tabs: [Text("Kasbon"), Text("Reimburse")],
                          indicatorColor: Color(0xFF2B4D66),
                          indicatorWeight: 2,
                          unselectedLabelColor: Color(0x772B4D66),
                          labelColor: Color(0xFF2B4D66),
                        )),
                  )),
            ),
            body: TabBarView(children: [
              ListView(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Minggu ini",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF555555)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("Tandai sudah dibaca",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xFFA8A8A8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))),
                        ],
                      )),
                  ListViewApproval(
                    idRoleApproval: widget.idRoleApproval,
                    jenisPengajuan: "Kasbon",
                    bodyApproval:
                        BodyApproval(status: "aktif", tipe: "pengajuan"),
                  )
                ],
              ),
              ListView(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 7, 15, 7),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Minggu ini",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w700,
                                fontSize: 18,
                                color: Color(0xFF555555)),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text("Tandai sudah dibaca",
                                  style: GoogleFonts.montserrat(
                                      color: Color(0xFFA8A8A8),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12))),
                        ],
                      )),
                  ListViewApproval(
                    idRoleApproval: widget.idRoleApproval,
                    jenisPengajuan: "Reimburse",
                    bodyApproval:
                        BodyApproval(status: "aktif", tipe: "pengajuan"),
                  )
                ],
              ),
            ]),
          )),
    );
  }
}

class ListViewApproval extends StatefulWidget {
  final String jenisPengajuan;
  final int idRoleApproval;
  final BodyApproval bodyApproval;

  ListViewApproval(
      {this.jenisPengajuan, this.idRoleApproval, this.bodyApproval});
  @override
  _ListViewApprovalState createState() => _ListViewApprovalState();
}

class _ListViewApprovalState extends State<ListViewApproval> {
  @override
  void initState() {
    BlocProvider.of<ListApprovalBloc>(context).add(GetApprovalPengajuanEvent(
        idRoleApproval: widget.idRoleApproval,
        bodyApproval: widget.bodyApproval,
        jenisPengajuan: widget.jenisPengajuan));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListApprovalBloc, BaseState>(builder: (context, state) {
      if (state is ListApprovalPengajuanState) {
        if (state.listApprovalPengajuan.isNotEmpty) {
          List<Widget> list = [];
          state.listApprovalPengajuan.forEach((element) {
            list.add(Container(
                margin: EdgeInsets.only(bottom: 10),
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: CustomCard(
                    container: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 2,
                            child: Icon(
                              Icons.insert_drive_file_outlined,
                              size: 27,
                            )),
                        Flexible(
                          flex: 15,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                  flex: 10,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(bottom: 5),
                                          child: Text(
                                            element.tujuan,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 14),
                                          )),
                                      Text(
                                        "id kategori = " +
                                            element.idKategoriPengajuan
                                                .toString(),
                                        overflow: TextOverflow.ellipsis,
                                      )
                                    ],
                                  )),
                              Flexible(
                                  flex: 6,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5),
                                        child: Text(
                                          DateFormat.yMMMd()
                                              .format(element.tglPengajuan),
                                          overflow: TextOverflow.ellipsis,
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF6f96b0)),
                                        ),
                                      ),
                                      Text(
                                        "Rp" +
                                            NumberFormat.currency(
                                                    locale: "eu", symbol: "")
                                                .format(
                                                    element.nominalRealisasi),
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
                ))));
          });
          return Column(
            children: list,
          );
        } else {
          return Text("KOSONG");
        }
      } else
        return Text("STATE SALAH");
    });
  }
}

class NoteDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Catatan Dari Approval",
                  style: TextStyle(
                      fontFamily: "Montserrat", fontWeight: FontWeight.w600),
                )),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: Colors.black45),
                  errorStyle: TextStyle(color: Colors.redAccent),
                  border: OutlineInputBorder(),
                  labelText: 'Catatan',
                ),
                onTap: () {},
                //controller: tanggalSelesai,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Batal",
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
                  onPressed: () {},
                  child: Text("Kirim",
                      style: TextStyle(
                          fontFamily: "Montserrat",
                          fontWeight: FontWeight.w600,
                          color: Colors.white)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
