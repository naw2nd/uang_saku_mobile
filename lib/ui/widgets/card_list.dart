import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/ui/list_kasbon.dart';
import 'package:uang_saku/ui/widgets/details_pengajuan.dart';
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

  @override
  void initState() {
    print("init event");
    context.read<ListKasbonBloc>().add(ListKasbonEvent());
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Icon(
                      Icons.file_present,
                      color: Colors.blue,
                      size: 40,
                    ),
                    Column(
                      children: <Widget>[
                        Text(x.statusApproval,
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
              );
            });
      } else {
        print("gagal");
        return Container();
      }
    });
  }
}
