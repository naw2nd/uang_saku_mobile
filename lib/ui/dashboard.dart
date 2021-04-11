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
import 'package:uang_saku/ui/custom_widgets/custom_card.dart';
import 'package:uang_saku/ui/list_approval.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:uang_saku/ui/list_reimburse.dart';
import 'package:intl/intl.dart';

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
            child: Column(
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
                Expanded(
                  child: Container(
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
                                                    style:
                                                        GoogleFonts.montserrat(
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
                                                    style:
                                                        GoogleFonts.montserrat(
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
                          ListMenuApproval(),
                          ProgressPengajuan(),
                          Container(
                            padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Aktifitas Terakhir",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Color(0xFF555555)),
                                ),
                                Container(
                                  height: 20,
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 7)),
                                    child: Text(
                                      "Lihat semua",
                                      style: GoogleFonts.montserrat(
                                          color: Color(0xFF555555)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          LatestActivity(),
                          Container(height: 50)
                        ],
                      ),
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

class ProgressPengajuan extends StatefulWidget {
  @override
  _ProgressPengajuanState createState() => _ProgressPengajuanState();
}

class _ProgressPengajuanState extends State<ProgressPengajuan> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Text(
            "Progress Pengajuan",
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 18,
                color: Color(0xFF555555)),
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
              color: Color(0xffededed),
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Color(0xFF358BFC),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.of(context).size.width / 2 - 37,
                      height: 35,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.zero),
                          child: Text(
                            "Kasbon",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.white),
                          ))),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      width: MediaQuery.of(context).size.width / 2 - 37,
                      height: 35,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.zero),
                          child: Text(
                            "Reimburse",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Color(0xff555555)),
                          ))),
                ],
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("images/icon-send.png"),
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    Text(
                      "Diajukan",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555555)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("images/icon-decline.png"),
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Text(
                      "Ditolak",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555555)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("images/icon-approve.png"),
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    Text(
                      "Disetujui",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555555)),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {},
                        child: Image(
                          image: AssetImage("images/icon-coin.png"),
                          width: 25,
                          height: 25,
                        ),
                      ),
                    ),
                    Text(
                      "Dicairkan",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff555555)),
                    ),
                  ],
                ),
              ])
            ],
          ),
        ),
      ],
    );
  }
}

class ListMenuApproval extends StatefulWidget {
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
                    child: (state.roleApproval.length == 1)
                        ? Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 145,
                          child: MenuApproval(
                              roleApproval: state.roleApproval.first,
                            ),
                        )
                        : CarouselSlider(
                            options: CarouselOptions(
                              height: 145,
                              enlargeCenterPage: true,
                            ),
                            items: state.roleApproval.map((i) {
                              return MenuApproval(roleApproval: i);
                            }).toList(),
                          ))
              ]);
        }
      } else
        return Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.center,
            child: CircularProgressIndicator());
    });
  }
}

class MenuApproval extends StatelessWidget {
  final RoleApproval roleApproval;
  MenuApproval({this.roleApproval});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
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

class LatestActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomCard(
              container: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 2,
                      child: Image(
                          image: AssetImage("images/icon-done.png"),
                          width: 27,
                          height: 27)),
                  Flexible(
                    flex: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Approval Kasbon Selesai",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          color: Color(0xff555555),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    )),
                                Text(
                                  "Perjalanan dengan client perusahaan",
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
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF6f96b0)),
                                  ),
                                ),
                                Text(
                                  "",
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
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomCard(
              container: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 2,
                      child: Image(
                          image: AssetImage("images/icon-done.png"),
                          width: 27,
                          height: 27)),
                  Flexible(
                    flex: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Approval Reimburse Selesai",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          color: Color(0xff555555),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    )),
                                Text(
                                  "Makan makan dengan client perusahaan",
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
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF6f96b0)),
                                  ),
                                ),
                                Text(
                                  "",
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
        ),
        Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: CustomCard(
              container: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                      flex: 2,
                      child: Image(
                          image: AssetImage("images/paper-clip.png"),
                          width: 31,
                          height: 31)),
                  Flexible(
                    flex: 15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    child: Text(
                                      "Laporan Kasbon Selesai",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                          color: Color(0xff555555),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 14),
                                    )),
                                Text(
                                  "Renang dengan client perusahaan",
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
                                    DateFormat.yMMMd().format(DateTime.now()),
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF6f96b0)),
                                  ),
                                ),
                                Text(
                                  "",
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
        ),
      ],
    );
  }
}
