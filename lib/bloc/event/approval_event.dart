import 'package:uang_saku/model/models.dart';

import 'base_event.dart';

class GetApprovalPengajuanEvent extends BaseEvent {
  final int idRoleApproval;
  final BodyApproval bodyApproval;
  final String jenisPengajuan;
  GetApprovalPengajuanEvent(
      {this.idRoleApproval, this.bodyApproval, this.jenisPengajuan});
  @override
  List<Object> get props =>
      [this.idRoleApproval, this.bodyApproval, this.jenisPengajuan];
}
