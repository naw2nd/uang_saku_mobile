import 'package:uang_saku/model/models.dart';

import 'base_event.dart';

class GetApprovalReimbruseEvent extends BaseEvent {
  final int idRoleApproval;
  final BodyApproval bodyApproval;
  GetApprovalReimbruseEvent({this.idRoleApproval, this.bodyApproval});
  @override
  List<Object> get props => [this.idRoleApproval, this.bodyApproval];
}
