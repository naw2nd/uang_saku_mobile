import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';

class CreatePengajuanState extends BaseState {
  final List<KategoriPengajuan> listKategori;
  final List<Perusahaan> listPerusahaan;
  final List<Department> listDepartment;
  final List<Cabang> listCabang;
  CreatePengajuanState(
      {this.listCabang,
      this.listPerusahaan,
      this.listKategori,
      this.listDepartment});
  @override
  List<Object> get props => [
        this.listKategori,
        this.listPerusahaan,
        this.listCabang,
        this.listDepartment
      ];
}

class CreateRincianBiayaState extends BaseState {
  final List<KategoriBiaya> listKategoriBiaya;
  CreateRincianBiayaState({
    this.listKategoriBiaya,
  });
  @override
  List<Object> get props => [this.listKategoriBiaya];
}

class RincianBiayaState extends BaseState {
  final rincianBiaya;
  RincianBiayaState({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}

class DeleteRincianBiayaState extends BaseState {
  final rincianBiaya;
  DeleteRincianBiayaState({
    this.rincianBiaya,
  });
  @override
  List<Object> get props => [this.rincianBiaya];
}
