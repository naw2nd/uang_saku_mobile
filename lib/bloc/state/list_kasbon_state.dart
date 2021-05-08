import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/kasbon.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/ui/list_kasbon.dart';

class ListKasbonState extends BaseState {
  final List<Kasbon> kasbon;

  ListKasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}

class KasbonState extends BaseState {
  final Kasbon kasbon;

  KasbonState({this.kasbon});

  @override
  List<Object> get props => [kasbon];
}
class FormAttributeStateKasbon extends BaseState {
  final List<KategoriPengajuan> listKategori;
  final List<Perusahaan> listPerusahaan;
  final List<Department> listDepartment;
  final List<Cabang> listCabang;
  FormAttributeStateKasbon(
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