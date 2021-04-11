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
