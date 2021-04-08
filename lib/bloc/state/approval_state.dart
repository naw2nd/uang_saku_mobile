import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/role_approval.dart';

class RoleApprovalState extends BaseState {
  final List<RoleApproval> roleApproval;
  RoleApprovalState({this.roleApproval});
  @override
  List<Object> get props => [this.roleApproval];
}
class ListApprovalPengajuanState extends BaseState {
  final List listApprovalPengajuan;
  ListApprovalPengajuanState({this.listApprovalPengajuan});
  @override
  List<Object> get props => [this.listApprovalPengajuan];
}
