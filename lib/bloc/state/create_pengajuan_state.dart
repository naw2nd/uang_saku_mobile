import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/models.dart';

class CreatePengajuanState extends BaseState {
  final List<KategoriPengajuan> listKategori;
  final List<Perusahaan> listPerusahaan;
  final List<Cabang> listCabang;
  CreatePengajuanState(
      {this.listCabang, this.listPerusahaan, this.listKategori});
  @override
  List<Object> get props =>
      [this.listKategori, this.listPerusahaan, this.listCabang];
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
  final RincianRealisasi rincianRealisasi;
  RincianBiayaState({
    this.rincianRealisasi,
  });
  @override
  List<Object> get props => [this.rincianRealisasi];
}
