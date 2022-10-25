import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/rincian_pengajuan.dart';

class CreateReimburseEvent extends BaseEvent {
  // Event untuk Post reimburse
  final Reimburse reimburse;
  CreateReimburseEvent({this.reimburse});
  @override
  List<Object> get props => [this.reimburse];
}

class CreateKasbonEvent extends BaseEvent {
  // Event untuk Post kasbon
  final Kasbon kasbon;
  CreateKasbonEvent({this.kasbon});
  @override
  List<Object> get props => [this.kasbon];
}

class AddRincianBiayaEvent extends BaseEvent {
  //event untuk menambahkan rincian biaya di UInya
  final rincianBiaya;
  AddRincianBiayaEvent({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}

class EditRincianBiayaEvent extends BaseEvent {
  //event untuk mengedit rincian biaya pada update pengajuan
  final rincianBiaya;
  EditRincianBiayaEvent({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}

class DeleteRincianBiayaEvent extends BaseEvent {
  //event untuk menghapus rincian biaya di UInya
  final rincianBiaya;
  DeleteRincianBiayaEvent({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}
