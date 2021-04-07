import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/approval_event.dart';
import 'package:uang_saku/bloc/list_approval._bloc.dart';
import 'package:uang_saku/bloc/list_kasbon_bloc.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/filter_approval.dart';
import 'package:uang_saku/ui/widgets/kasbon_card.dart';
import 'package:uang_saku/ui/widgets/reimburse_card.dart';
import 'package:badges/badges.dart';

class ListApproval extends StatefulWidget {
  final int idRoleApproval;
  ListApproval({this.idRoleApproval});
  @override
  _ListApprovalState createState() => _ListApprovalState();
}

class _ListApprovalState extends State<ListApproval> {
  @override
  void initState() {
    print("init event");
    BlocProvider.of<ListApprovalBloc>(context).add(GetApprovalReimbruseEvent(
        idRoleApproval: widget.idRoleApproval,
        bodyApproval: BodyApproval(status: "aktif", tipe: "pengajuan")));

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
                "Approval ",
                style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w900,
                    fontSize: 20),
              ),
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
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
                        child: BlocBuilder<ListKasbonBloc, BaseState>(
                            builder: (_, state) {
                          if (state is ListKasbonState) {
                            return TabBar(
                              labelStyle: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                              tabs: <Widget>[
                                Badge(
                                  badgeContent:
                                      Text(state.kasbon.length.toString()),
                                  child: Text("Kasbon"),
                                ),
                                Badge(
                                  badgeContent:
                                      Text(state.kasbon.length.toString()),
                                  child: Text("Reimburse"),
                                )
                              ],
                              indicatorColor: Color(0xFF2B4D66),
                              labelColor: Color(0xFF2B4D66),
                            );
                          } else {
                            print("badge nya gagal ngab");
                            Container();
                          }
                        })),
                  )),
            ),
            body: TabBarView(children: <Widget>[
              Center(
                child: ListView(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
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
                  ],
                ),
              ),
              ListView(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
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
                  ReimburseCard()
                ],
              ),
            ]),
          )),
    );
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
          children: <Widget>[
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
              children: <Widget>[
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

// TabBar myTabBar = TabBar(
//   labelStyle: TextStyle(
//       fontFamily: "Montserrat", fontWeight: FontWeight.w600, fontSize: 18),
//   tabs: <Widget>[
//     BlocBuilder<ListKasbonBloc, BaseState>(builder: (_, state) {
//       if (state is ListKasbonState) {
//         Badge(
//           badgeContent: Text(state.kasbon.length.toString()),
//           child: Text("Kasbon"),
//         );
//       }
//       ;
//     }),
//     // Badge(
//     //   badgeContent: Text("1"),
//     //   child: Text("Reimburse"),
//     // )
//   ],
//   indicatorColor: Color(0xFF2B4D66),
//   labelColor: Color(0xFF2B4D66),
// );
