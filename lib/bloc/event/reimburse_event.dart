import 'package:uang_saku/model/models.dart';

import 'base_event.dart';

class ReimburseEvent extends BaseEvent {
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
