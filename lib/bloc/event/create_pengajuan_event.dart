import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/rincian_pengajuan.dart';

class CreateReimburseEvent extends BaseEvent {
  final Reimburse reimburse;
  CreateReimburseEvent({this.reimburse});
  @override
  List<Object> get props => [this.reimburse];
}

class CreateKasbonEvent extends BaseEvent {
  final Kasbon kasbon;
  CreateKasbonEvent({this.kasbon});
  @override
  List<Object> get props => [this.kasbon];
}

class AddRincianBiayaEvent extends BaseEvent {
  final rincianBiaya;
  AddRincianBiayaEvent({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}

class DeleteRincianBiayaEvent extends BaseEvent {
  final rincianBiaya;
  DeleteRincianBiayaEvent({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}
