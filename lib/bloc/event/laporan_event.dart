import 'package:uang_saku/model/kasbon.dart';
import 'base_event.dart';

class CreateLaporanEvent extends BaseEvent {
  final Kasbon kasbon;
  CreateLaporanEvent({this.kasbon});
  @override
  List<Object> get props => [this.kasbon];
}
