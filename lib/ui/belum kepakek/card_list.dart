import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/list_reimburse_bloc.dart';
import 'package:uang_saku/bloc/state/list_reimburse_state.dart';
import 'package:intl/intl.dart';

class CardList extends StatefulWidget {
  String judul = "Kasbon disetujui korcab";

  CardList({this.judul});
  @override
  _CardListState createState() => _CardListState(judul: judul);
}

class _CardListState extends State<CardList> {
  String judul = "Kasbon disetujui korcab";

  _CardListState({this.judul});

  // @override
  // void initState() {
  //   print("init event");
  //   context.read<ListKasbonBloc>().add(ListKasbonEvent());
  //   context.read<ListReimburseBloc>().add(ListReimburseEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[KasbonCard(), ReimburseCard()],
      ),
    );
  }
}

class KasbonCard extends StatefulWidget {
  @override
  _KasbonCardState createState() => _KasbonCardState();
}

class _KasbonCardState extends State<KasbonCard> {
  @override
  void initState() {
    print("init event");
    // context.read<ListKasbonBloc>().add(ListKasbonEvent());
    //context.read<ListReimburseBloc>().add(ListReimburseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListKasbonBloc, BaseState>(builder: (_, state) {
      print("Bloc panggil");
      print(state);
      if (state is ListKasbonState) {
        return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: state.kasbon == null ? 0 : state.kasbon.length,
            itemBuilder: (context, i) {
              final x = state.kasbon[i];
              return Card(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.file_present,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("x.statusApproval",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          Text(x.tujuan,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500],
                                  fontSize: 12))
                        ],
                      ),
                      Text(DateFormat.yMMMMd('en_US').format(x.tglPengajuan),
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                              fontSize: 12))
                    ],
                  ),
                ),
              );
            });
      } else {
        print("gagal cuy");
        return Container();
      }
    });
  }
}

class ReimburseCard extends StatefulWidget {
  @override
  _ReimburseCardState createState() => _ReimburseCardState();
}

class _ReimburseCardState extends State<ReimburseCard> {
  @override
  void initState() {
    print("init event");
    // context.read<ListReimburseBloc>().add(ListReimburseEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListReimburseBloc, BaseState>(builder: (_, state) {
      print("Bloc panggil");
      print(state);
      if (state is ListReimburseState) {
        return ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: state.reimburse == null ? 0 : state.reimburse.length,
            itemBuilder: (context, i) {
              final x = state.reimburse[i];
              return Card(
                margin: EdgeInsets.fromLTRB(10, 5, 10, 10),
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(
                        Icons.file_present,
                        color: Colors.blue,
                        size: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("x.statusApproval",
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          Text(x.tujuan,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500],
                                  fontSize: 12))
                        ],
                      ),
                      Text(DateFormat.yMMMMd('en_US').format(x.tglPengajuan),
                          style: TextStyle(
                              fontFamily: "Montserrat",
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[500],
                              fontSize: 12))
                    ],
                  ),
                ),
              );
            });
      } else {
        print("gagal cuy");
        return Container();
      }
    });
  }
}
