import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/laporan.dart';
import 'base_event.dart';

class CreateLaporanEvent extends BaseEvent {
  final Laporan laporan;
  final int idPengajuanKasbon;
  CreateLaporanEvent({this.laporan, this.idPengajuanKasbon});
  @override
  List<Object> get props => [this.laporan, this.idPengajuanKasbon];
}
