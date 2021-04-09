import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/ui/list_kasbon.dart';

class ListKasbonState extends BaseState {
  final List<Kasbon> kasbon;

  ListKasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}

class KasbonState extends BaseState {
  final Kasbon kasbon;

  KasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}
