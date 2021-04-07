// To parse this JSON data, do
//
//     final roleApproval = roleApprovalFromJson(jsonString);

import 'dart:convert';

RoleApproval roleApprovalFromJson(String str) =>
    RoleApproval.fromJson(json.decode(str));

String roleApprovalToJson(RoleApproval data) => json.encode(data.toJson());

class RoleApproval {
  RoleApproval({
    this.kasbonCount,
    this.reimburseCount,
    this.idApproval,
    this.namaApproval,
    this.status,
  });

  final int kasbonCount;
  final int reimburseCount;
  final int idApproval;
  final String namaApproval;
  final int status;

  factory RoleApproval.fromJson(Map<String, dynamic> json) => RoleApproval(
        kasbonCount: json["kasbon_count"],
        reimburseCount: json["reimburse_count"],
        idApproval: json["id_approval"],
        namaApproval: json["nama_approval"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "kasbon_count": kasbonCount,
        "reimburse_count": reimburseCount,
        "id_approval": idApproval,
        "nama_approval": namaApproval,
        "status": status,
      };
}
