import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/kategori_pengajuan.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/role_approval.dart';

class RoleApprovalState extends BaseState {
  //state untuk mengembalikan role approval yang dimilki user
  final List<RoleApproval> roleApproval;
  RoleApprovalState({this.roleApproval});
  @override
  List<Object> get props => [this.roleApproval];
}

class ListApprovalPengajuanState extends BaseState {
  //state untuk list approval pada pengajuan
  final List listApprovalPengajuan;
  final List<KategoriPengajuan> listKategoriPengajuan;
  ListApprovalPengajuanState(
      {this.listApprovalPengajuan, this.listKategoriPengajuan});
  @override
  List<Object> get props => [this.listApprovalPengajuan];
}
