// To parse this JSON data, do
//
//     final bodyPostApproval = bodyPostApprovalFromJson(jsonString);

import 'dart:convert';

BodyPostApproval bodyPostApprovalFromJson(String str) =>
    BodyPostApproval.fromJson(json.decode(str));

String bodyPostApprovalToJson(BodyPostApproval data) =>
    json.encode(data.toJson());

class BodyPostApproval {
  BodyPostApproval(
      {this.idPengajuanKasbon,
      this.status,
      this.catatan,
      this.idPengajuanReimburse,
      this.tipe});

  final int idPengajuanKasbon;
  final int idPengajuanReimburse;
  final String tipe;
  final String status;
  final String catatan;

  factory BodyPostApproval.fromJson(Map<String, dynamic> json) =>
      BodyPostApproval(
        idPengajuanKasbon: json["id_pengajuan_kasbon"],
        idPengajuanReimburse: json["id_pengajuan_reimburse"],
        status: json["status"],
        catatan: json["catatan"],
      );

  Map<String, dynamic> toJson() => {
        "id_pengajuan_kasbon":
            (idPengajuanKasbon != null) ? idPengajuanKasbon : "",
        "id_pengajuan_reimburse":
            (idPengajuanReimburse != null) ? idPengajuanReimburse : "",
        "status": status,
        "tipe": tipe,
        "catatan": catatan,
      };
}
