import 'package:uang_saku/bloc/state/base_state.dart';
import 'package:uang_saku/model/models.dart';

class ListReimburseState extends BaseState {
  final List<Reimburse> reimburse;

  ListReimburseState({this.reimburse});

  @override
  List<Object> get props => [this.reimburse];
}
class ReimburseState extends BaseState {
  final Reimburse reimburse;

  ReimburseState({this.reimburse});

  @override
  List<Object> get props => [reimburse];
}

class FormAttributeStateReimburse extends BaseState {
  final List<KategoriPengajuan> listKategori;
  final List<Perusahaan> listPerusahaan;
  final List<Department> listDepartment;
  final List<Cabang> listCabang;
  FormAttributeStateReimburse(
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