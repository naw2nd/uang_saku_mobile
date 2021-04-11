import 'package:uang_saku/model/body_post_approval.dart';
import 'package:uang_saku/model/models.dart';

import 'base_event.dart';

class GetApprovalPengajuanEvent extends BaseEvent {
  final int idRoleApproval;
  final BodyGetApproval bodyApproval;
  final String jenisPengajuan;
  GetApprovalPengajuanEvent(
      {this.idRoleApproval, this.bodyApproval, this.jenisPengajuan});
  @override
  List<Object> get props =>
      [this.idRoleApproval, this.bodyApproval, this.jenisPengajuan];
}

class PostApprovalKasbonEvent extends BaseEvent {
  final int idRoleApproval;
  final BodyPostApproval bodyApproval;
  PostApprovalKasbonEvent({this.idRoleApproval, this.bodyApproval});
  @override
  List<Object> get props => [this.idRoleApproval, this.bodyApproval];
}

class PostApprovalReimburseEvent extends BaseEvent {
  final int idRoleApproval;
  final BodyPostApproval bodyApproval;
  PostApprovalReimburseEvent({this.idRoleApproval, this.bodyApproval});
  @override
  List<Object> get props => [this.idRoleApproval, this.bodyApproval];
}
