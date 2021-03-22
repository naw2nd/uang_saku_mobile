import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/ui/list_kasbon.dart';

class ListKasbonState extends BaseState {
  final ListKasbon listKasbon;

  ListKasbonState({this.listKasbon});

  @override
  List<Object> get props => [listKasbon];

}