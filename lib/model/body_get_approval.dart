// To parse this JSON data, do
//
//     final bodyApproval = bodyApprovalFromJson(jsonString);

import 'dart:convert';

BodyGetApproval bodyApprovalFromJson(String str) => BodyGetApproval.fromJson(json.decode(str));

String bodyApprovalToJson(BodyGetApproval data) => json.encode(data.toJson());

//body untuk filter pada saat GET Approval dari api
class BodyGetApproval {
    BodyGetApproval({
        this.tipe,
        this.status,
        this.idDepartment,
        this.idKategoriPengajuan,
        this.idCabang,
        this.idPerusahaan,
        this.tglMulai,
        this.tglSelesai,
    });

    final String tipe;
    final String status;
    final List<int> idDepartment;
    final List<int> idKategoriPengajuan;
    final List<int> idCabang;
    final List<int> idPerusahaan;
    final DateTime tglMulai;
    final DateTime tglSelesai;

    factory BodyGetApproval.fromJson(Map<String, dynamic> json) => BodyGetApproval(
        tipe: json["tipe"],
        status: json["status"],
        idDepartment: List<int>.from(json["id_department"].map((x) => x)),
        idKategoriPengajuan: List<int>.from(json["id_kategori_pengajuan"].map((x) => x)),
        idCabang: List<int>.from(json["id_cabang"].map((x) => x)),
        idPerusahaan: List<int>.from(json["id_perusahaan"].map((x) => x)),
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        tglSelesai: DateTime.parse(json["tgl_selesai"]),
    );

    Map<String, dynamic> toJson() => {
        "tipe": tipe,
        "status": status,
        // "id_department": List<dynamic>.from(idDepartment.map((x) => x)),
        // "id_kategori_pengajuan": List<dynamic>.from(idKategoriPengajuan.map((x) => x)),
        // "id_cabang": List<dynamic>.from(idCabang.map((x) => x)),
        // "id_perusahaan": List<dynamic>.from(idPerusahaan.map((x) => x)),
        // "tgl_mulai": "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        // "tgl_selesai": "${tglSelesai.year.toString().padLeft(4, '0')}-${tglSelesai.month.toString().padLeft(2, '0')}-${tglSelesai.day.toString().padLeft(2, '0')}",
    };
}
