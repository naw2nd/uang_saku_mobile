import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/reimburse.dart';

class CreateReimburseEvent extends BaseEvent {
  final Reimburse reimburse;
  CreateReimburseEvent({this.reimburse});
  @override
  List<Object> get props => [this.reimburse];
}

class InitPengajuanEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class InitRincianEvent extends BaseEvent {
  @override
  List<Object> get props => [];
}

class AddRincianBiayaEvent extends BaseEvent {
  final RincianRealisasi rincianRealisasi;
  AddRincianBiayaEvent({
    this.rincianRealisasi,
  });
  @override
  List<Object> get props => [this.rincianRealisasi];
}
