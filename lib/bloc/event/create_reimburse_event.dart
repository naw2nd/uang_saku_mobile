import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/reimburse.dart';

class CreateReimburseEvent extends BaseEvent {
  final Reimburse reimburse;
  CreateReimburseEvent({this.reimburse});
  @override
  List<Object> get props => [this.reimburse];
}

class GetMenuItemsEvent extends BaseEvent{

  @override
  List<Object> get props => [];
}