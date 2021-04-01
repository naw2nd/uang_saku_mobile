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
