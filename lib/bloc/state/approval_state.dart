import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/reimburse.dart';
import 'package:uang_saku/model/role_approval.dart';

class RoleApprovalState extends BaseState {
  final List<RoleApproval> roleApproval;
  RoleApprovalState({this.roleApproval});
  @override
  List<Object> get props => [this.roleApproval];
}
class ListApprovalReimburseState extends BaseState {
  final List<Reimburse> listApprovalReimburse;
  ListApprovalReimburseState({this.listApprovalReimburse});
  @override
  List<Object> get props => [this.listApprovalReimburse];
}
