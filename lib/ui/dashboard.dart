import 'package:carousel_slider/carousel_slider.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/state/approval_state.dart';
import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/bloc/role_approval_bloc.dart';
import 'package:uang_saku/model/role_approval.dart';
import 'package:uang_saku/ui/list_approval.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:uang_saku/ui/list_reimburse.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool _hasbeenPressed = true;
  bool _textHasBeenPressed = true;
  bool _laporanBackground = true;
  bool _laporanText = true;
  bool _kasbonBackground = true;
  bool _kasbonText = true;
  final _controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xFF358BFC), Color(0xFF3AE3CE)])),
          child: SafeArea(
            child: Wrap(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(
                        image: AssetImage("images/uangsaku.png"),
                        width: 150,
                        height: 50,
                      ),
                      Image(
                        image: AssetImage("images/icon_dashboard.png"),
                        width: 30,
                        height: 30,
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height - 120,
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      color: Color(0xFFF5F5F5),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15))),
                  child: FadingEdgeScrollView.fromScrollView(
                    child: ListView(
                      controller: _controller,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  "Pengajuan",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFF555555)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ListKasbon();
                                        }));
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF358BFC),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                "images/kasbon.png",
                                              )),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: Text(
                                                  "Kasbon",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Flexible(
                                    flex: 20,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return ListReimburse();
                                        }));
                                      },
                                      child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.only(
                                              top: 30, bottom: 30),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF3AE3CE),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          child: Column(
                                            children: [
                                              Image(
                                                  image: AssetImage(
                                                      "images/reimburse.png")),
                                              Container(
                                                padding:
                                                    EdgeInsets.only(top: 15),
                                                child: Text(
                                                  "Reimburse",
                                                  style: GoogleFonts.montserrat(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 20),
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        ListMenuApproval(mainContext: context),
                        // Container(
                        //   padding: EdgeInsets.symmetric(horizontal: 15),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Container(
                        //         padding: EdgeInsets.only(top: 10, bottom: 5),
                        //         child: Text(
                        //           "Progres Pengajuan",
                        //           style: GoogleFonts.montserrat(
                        //               fontWeight: FontWeight.w700,
                        //               fontSize: 18,
                        //               color: Color(0xFF555555)),
                        //         ),
                        //       ),
                        //       Container(
                        //         height: 150,
                        //         padding: EdgeInsets.only(
                        //             right: 10, left: 10, top: 10),
                        //         decoration: BoxDecoration(
                        //             color: Colors.grey,
                        //             borderRadius: BorderRadius.circular(15)),
                        //         child: Column(
                        //           children: <Widget>[
                        //             Container(
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: <Widget>[
                        //                   RaisedButton(
                        //                     shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15)),
                        //                     color: _hasbeenPressed
                        //                         ? Colors.white
                        //                         : Color(0xFF358BFC),
                        //                     onPressed: () {
                        //                       setState(() {
                        //                         _hasbeenPressed =
                        //                             !_hasbeenPressed;
                        //                         _textHasBeenPressed =
                        //                             !_textHasBeenPressed;
                        //                       });
                        //                       // Color(0xFF358BFC);
                        //                     },
                        //                     child: Text(
                        //                       "Kasbon",
                        //                       style: TextStyle(
                        //                           fontFamily: "Montserrat",
                        //                           fontWeight: FontWeight.w700,
                        //                           color: _textHasBeenPressed
                        //                               ? Color(0xFF9E9E9E)
                        //                               : Colors.white),
                        //                     ),
                        //                   ),
                        //                   RaisedButton(
                        //                     shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15)),
                        //                     color: _laporanBackground
                        //                         ? Colors.white
                        //                         : Color(0xFF358BFC),
                        //                     onPressed: () {
                        //                       setState(() {
                        //                         _laporanBackground =
                        //                             !_laporanBackground;
                        //                         _laporanText = !_laporanText;
                        //                       });
                        //                       // Color(0xFF358BFC);
                        //                     },
                        //                     child: Text(
                        //                       "Laporan",
                        //                       style: TextStyle(
                        //                           fontFamily: "Montserrat",
                        //                           fontWeight: FontWeight.w700,
                        //                           color: _laporanText
                        //                               ? Color(0xFF9E9E9E)
                        //                               : Colors.white),
                        //                     ),
                        //                   ),
                        //                   RaisedButton(
                        //                     shape: RoundedRectangleBorder(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15)),
                        //                     color: _kasbonBackground
                        //                         ? Colors.white
                        //                         : Color(0xFF358BFC),
                        //                     onPressed: () {
                        //                       setState(() {
                        //                         _kasbonBackground =
                        //                             !_kasbonBackground;
                        //                         _kasbonText = !_kasbonText;
                        //                       });
                        //                       // Color(0xFF358BFC);
                        //                     },
                        //                     child: Text(
                        //                       "Reimburse",
                        //                       style: TextStyle(
                        //                           fontFamily: "Montserrat",
                        //                           fontWeight: FontWeight.w700,
                        //                           color: _kasbonText
                        //                               ? Color(0xFF9E9E9E)
                        //                               : Colors.white),
                        //                     ),
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //             Flexible(
                        //               flex: 1,
                        //               child: Row(
                        //                 mainAxisAlignment:
                        //                     MainAxisAlignment.spaceBetween,
                        //                 children: <Widget>[
                        //                   Column(
                        //                     children: <Widget>[
                        //                       ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15),
                        //                         child: Container(
                        //                             color: Colors.white,
                        //                             width: 50,
                        //                             height: 50,
                        //                             child: IconButton(
                        //                                 icon: Icon(
                        //                                   Icons
                        //                                       .arrow_right_alt_rounded,
                        //                                   size: 35,
                        //                                   color: Colors.green,
                        //                                 ),
                        //                                 onPressed: () {})),
                        //                       ),
                        //                       Text("Diajukan",
                        //                           style: GoogleFonts.montserrat(
                        //                             color: Color(0xFF2B4D66),
                        //                           ))
                        //                     ],
                        //                   ),
                        //                   Column(
                        //                     children: <Widget>[
                        //                       ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15),
                        //                         child: Container(
                        //                             color: Colors.white,
                        //                             width: 50,
                        //                             height: 50,
                        //                             child: IconButton(
                        //                                 icon: Icon(
                        //                                   Icons.check_rounded,
                        //                                   size: 35,
                        //                                   color: Colors.blue,
                        //                                 ),
                        //                                 onPressed: () {})),
                        //                       ),
                        //                       Text("Disetujui",
                        //                           style: TextStyle(
                        //                             color: Color(0xFF2B4D66),
                        //                             fontFamily: "Montserrat",
                        //                           ))
                        //                     ],
                        //                   ),
                        //                   Column(
                        //                     children: <Widget>[
                        //                       ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15),
                        //                         child: Container(
                        //                             color: Colors.white,
                        //                             width: 50,
                        //                             height: 50,
                        //                             child: IconButton(
                        //                                 icon: Icon(
                        //                                   Icons.cancel_outlined,
                        //                                   size: 35,
                        //                                   color: Colors.red,
                        //                                 ),
                        //                                 onPressed: () {})),
                        //                       ),
                        //                       Text("Ditolak",
                        //                           style: TextStyle(
                        //                             color: Color(0xFF2B4D66),
                        //                             fontFamily: "Montserrat",
                        //                           ))
                        //                     ],
                        //                   ),
                        //                   Column(
                        //                     children: <Widget>[
                        //                       ClipRRect(
                        //                         borderRadius:
                        //                             BorderRadius.circular(15),
                        //                         child: Container(
                        //                             color: Colors.white,
                        //                             width: 50,
                        //                             height: 50,
                        //                             child: IconButton(
                        //                                 icon: Icon(
                        //                                   Icons
                        //                                       .attach_money_rounded,
                        //                                   size: 35,
                        //                                   color: Colors.orange,
                        //                                 ),
                        //                                 onPressed: () {})),
                        //                       ),
                        //                       Text("Dicairkan",
                        //                           style: TextStyle(
                        //                             color: Color(0xFF2B4D66),
                        //                             fontFamily: "Montserrat",
                        //                           ))
                        //                     ],
                        //                   )
                        //                 ],
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: <Widget>[
                        //           Container(
                        //             padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                        //             child: Text(
                        //               "Aktivitas Terakhir",
                        //               style: TextStyle(
                        //                   fontFamily: "Montserrat",
                        //                   fontWeight: FontWeight.w700,
                        //                   fontSize: 18,
                        //                   color: Color(0xFF555555)),
                        //             ),
                        //           ),
                        //           Padding(
                        //             padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                        //             child: TextButton(
                        //                 onPressed: () {},
                        //                 child: Text("Lihat semua",
                        //                     style: TextStyle(
                        //                         color: Color(0xFFA8A8A8),
                        //                         fontFamily: "Montserrat",
                        //                         fontWeight: FontWeight.w600,
                        //                         fontSize: 12))),
                        //           )
                        //         ],
                        //       ),
                        //       KasbonCard(),
                        //       ReimburseCard(),
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListMenuApproval extends StatefulWidget {
  final BuildContext mainContext;
  ListMenuApproval({this.mainContext});
  @override
  _ListMenuApprovalState createState() => _ListMenuApprovalState();
}

class _ListMenuApprovalState extends State<ListMenuApproval> {
  @override
  void initState() {
    BlocProvider.of<RoleApprovalBloc>(context).add(InitEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RoleApprovalBloc, BaseState>(builder: (context, state) {
      if (state is RoleApprovalState) {
        if (state.roleApproval.isEmpty)
          return Container();
        else {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Text(
                    "Approval",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Color(0xFF555555)),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 5),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        enlargeCenterPage: true,
                      ),
                      items: state.roleApproval.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                child: MenuApproval(
                              roleApproval: i,
                              mainContext: widget.mainContext,
                            ));
                          },
                        );
                      }).toList(),
                    ))
              ]);
        }
      } else
        return Container(
            padding: EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: CircularProgressIndicator());
    });
  }
}

class MenuApproval extends StatelessWidget {
  final BuildContext mainContext;
  final RoleApproval roleApproval;
  MenuApproval({this.roleApproval, this.mainContext});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(mainContext, MaterialPageRoute(builder: (context) {
            return ListApproval(
              idRoleApproval: roleApproval.idApproval,
              namaRoleApproval: roleApproval.namaApproval,
            );
          }));
        },
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              color: Color(0xFF2B4D66),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                            (roleApproval.kasbonCount +
                                    roleApproval.reimburseCount)
                                .toString(),
                            style: GoogleFonts.montserrat(
                                color: Color(0xFFE1F9F2),
                                fontSize: 75,
                                fontWeight: FontWeight.w700)),
                        Container(
                          padding: EdgeInsets.fromLTRB(5, 20, 0, 0),
                          child: Image(
                              image: AssetImage("images/jumlah_approval.png")),
                        ),
                      ],
                    ),
                    Container(
                      child: Text("Pengajuan menunggu disetujui oleh :",
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFE1F9F2),
                              fontSize: 14,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 15, bottom: 2),
                      child: Image(
                        image: AssetImage(
                            "images/" + roleApproval.namaApproval + ".png"),
                        width: 80,
                        height: 80,
                      ),
                    ),
                    Container(
                      child: Text(roleApproval.namaApproval,
                          style: GoogleFonts.montserrat(
                              color: Color(0xFFE1F9F2),
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.clip),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
