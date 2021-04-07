import 'package:uang_saku/bloc/bloc.dart';
import 'package:uang_saku/model/role_approval.dart';

class RoleApprovalState extends BaseState {
  final List<RoleApproval> roleApproval;
  RoleApprovalState({this.roleApproval});
  @override
  List<Object> get props => [this.roleApproval];
}
