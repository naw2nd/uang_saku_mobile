import 'package:uang_saku/model/models.dart';

import 'base_event.dart';
class GetFormAttributeReimburse extends BaseEvent {
  //event untuk mengambil data seperti perusahaan, cabang, dsb untuk create pengajuan
  @override
  List<Object> get props => [];
}
class GetListReimburseEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class GetReimburseEvent extends BaseEvent {
  final int id;
  GetReimburseEvent({this.id});
  @override
  List<Object> get props => [];
}

class UpdateReimburseEvent extends BaseEvent {
  final Reimburse reimburse;
  final int id;
  @override
  UpdateReimburseEvent({this.reimburse, this.id});
  List<Object> get props => [reimburse];
}
