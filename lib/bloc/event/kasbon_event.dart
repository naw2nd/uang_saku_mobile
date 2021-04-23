import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/bloc/event/base_event.dart';
import 'package:uang_saku/model/kasbon.dart';

class KasbonEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class GetKasbonEvent extends BaseEvent {
  final int id;
  GetKasbonEvent({this.id});
  @override
  List<Object> get props => [];
}

class CancelKasbonEvent extends BaseEvent {
  final int id;
  final String catatan;
  CancelKasbonEvent({this.id, this.catatan});
  @override
  List<Object> get props => [id, catatan];
}

class UpdateKasbonEvent extends BaseEvent {
  final Kasbon kasbon;
  final int id;
  @override
  UpdateKasbonEvent({this.kasbon, this.id});
  List<Object> get props => [kasbon];
}

// class  UpdateKasbonEvent extends BaseEvent {
//   @override
//   List<Object> get props => [];
// }
