import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';

class KasbonState extends BaseState {
  final Kasbon kasbon;

  KasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}

class CancelKasbonState extends KasbonState {
  final Kasbon kasbon;

  CancelKasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}
