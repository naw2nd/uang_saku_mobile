// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/status_approval.dart';

class Properties {
  Properties({
    this.page,
    this.total,
    this.totalPage,
    this.pageSize,
    this.hasMorePages,
  });

  int page;
  int total;
  int totalPage;
  int pageSize;
  bool hasMorePages;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        page: json["page"],
        total: json["total"],
        totalPage: json["total_page"],
        pageSize: json["page_size"],
        hasMorePages: json["has_more_pages"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "total": total,
        "total_page": totalPage,
        "page_size": pageSize,
        "has_more_pages": hasMorePages,
      };
}

List<Kasbon> modelKasbonFromJson(String str) =>
    List<Kasbon>.from(json.decode(str).map((x) => Kasbon.fromJson(x)));

String modelKasbonToJson(List<Kasbon> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Kasbon {
  Kasbon({
    this.idPengajuanKasbon,
    this.idPegawai,
    this.idDepartment,
    this.idCabang,
    this.idKategoriPengajuan,
    this.pelaksana,
    this.approval,
    this.tglPengajuan,
    this.tglPencairan,
    this.tglTotalan,
    this.tglMulai,
    this.tglSelesai,
    this.nomorPengajuan,
    this.statusApproval,
    this.statusPengajuan,
    this.statusPertanggungjawaban,
    this.statusPencairan,
    this.jenisPencairan,
    this.tujuan,
    this.catatanPengajuan,
    this.catatanLaporan,
    this.catatanPencairan,
    this.nominalPencairan,
    this.nominalRealisasi,
    this.nominalSelisih,
    this.additionalInfo,
    this.idPerusahaan,
    this.pegawai,
    this.perusahaan,
    this.department,
    this.cabang,
    this.kategoriPengajuan,
    this.rincianPengajuan,
    this.rincianRealisasi,
  });

  int idPengajuanKasbon;
  int idPegawai;
  int idDepartment;
  int idCabang;
  int idKategoriPengajuan;
  List<String> pelaksana;
  StatusApproval approval;
  DateTime tglPengajuan;
  dynamic tglPencairan;
  DateTime tglTotalan;
  DateTime tglMulai;
  DateTime tglSelesai;
  String nomorPengajuan;
  String statusApproval;
  int statusPengajuan;
  int statusPertanggungjawaban;
  int statusPencairan;
  String jenisPencairan;
  String tujuan;
  String catatanPengajuan;
  dynamic catatanLaporan;
  dynamic catatanPencairan;
  int nominalPencairan;
  dynamic nominalRealisasi;
  dynamic nominalSelisih;
  List<AdditionalInfo> additionalInfo;
  int idPerusahaan;
  Pegawai pegawai;
  Perusahaan perusahaan;
  Department department;
  Cabang cabang;
  KategoriPengajuan kategoriPengajuan;
  List<RincianPengajuan> rincianPengajuan;
  List<dynamic> rincianRealisasi;

  factory Kasbon.fromJson(Map<String, dynamic> json) => Kasbon(
        idPengajuanKasbon: json["id_pengajuan_kasbon"],
        idPegawai: json["id_pegawai"],
        idDepartment: json["id_department"],
        idCabang: json["id_cabang"],
        idKategoriPengajuan: json["id_kategori_pengajuan"],
        pelaksana: List<String>.from(json["pelaksana"].map((x) => x)),
        approval: StatusApproval.fromJson(json["approval"]),
        tglPengajuan: DateTime.parse(json["tgl_pengajuan"]) as DateTime,
        tglPencairan: json["tgl_pencairan"],
        tglTotalan: DateTime.parse(json["tgl_totalan"]),
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        tglSelesai: DateTime.parse(json["tgl_selesai"]),
        nomorPengajuan: json["nomor_pengajuan"],
        statusApproval: json["status_approval"] as String,
        statusPengajuan: json["status_pengajuan"],
        statusPertanggungjawaban: json["status_pertanggungjawaban"],
        statusPencairan: json["status_pencairan"],
        jenisPencairan: json["jenis_pencairan"],
        tujuan: json["tujuan"] as String,
        catatanPengajuan: json["catatan_pengajuan"],
        catatanLaporan: json["catatan_laporan"],
        catatanPencairan: json["catatan_pencairan"],
        nominalPencairan: json["nominal_pencairan"],
        nominalRealisasi: json["nominal_realisasi"],
        nominalSelisih: json["nominal_selisih"],
        additionalInfo: List<AdditionalInfo>.from(
            json["additional_info"].map((x) => AdditionalInfo.fromJson(x))),
        idPerusahaan: json["id_perusahaan"],
        pegawai: Pegawai.fromJson(json["pegawai"]),
        perusahaan: Perusahaan.fromJson(json["perusahaan"]),
        department: Department.fromJson(json["department"]),
        cabang: Cabang.fromJson(json["cabang"]),
        kategoriPengajuan:
            KategoriPengajuan.fromJson(json["kategori_pengajuan"]),
        rincianPengajuan: (json["rincian_pengajuan"] != null)
            ? List<RincianPengajuan>.from(json["rincian_pengajuan"]
                .map((x) => RincianPengajuan.fromJson(x)))
            : [],
        rincianRealisasi: (json["rincian_realisasi"] != null)
            ? List<dynamic>.from(json["rincian_realisasi"].map((x) => x))
            : [],
      );

  Map<String, dynamic> toJson() => {
        "id_pengajuan_kasbon": idPengajuanKasbon,
        "id_pegawai": idPegawai,
        "id_department": idDepartment,
        "id_cabang": idCabang,
        "id_kategori_pengajuan": idKategoriPengajuan,
        "pelaksana": List<dynamic>.from(pelaksana.map((x) => x)),
        // "approval": (approval != null) ? approval.toJson() : null,
        // "tgl_pengajuan": DateFormat("yyyy-MM-dd").format(DateTime.now()),
        // "tgl_pencairan": (tglPencairan != null)
        //     ? "${tglPencairan.year.toString().padLeft(4, '0')}-${tglPencairan.month.toString().padLeft(2, '0')}-${tglPencairan.day.toString().padLeft(2, '0')}"
        //     : null,
        // "tgl_totalan": (tglTotalan != null)
        //     ? "${tglTotalan.year.toString().padLeft(4, '0')}-${tglTotalan.month.toString().padLeft(2, '0')}-${tglTotalan.day.toString().padLeft(2, '0')}"
        //     : null,
        "tgl_mulai":
            "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        "tgl_selesai":
            "${tglSelesai.year.toString().padLeft(4, '0')}-${tglSelesai.month.toString().padLeft(2, '0')}-${tglSelesai.day.toString().padLeft(2, '0')}",
        "nomor_pengajuan": nomorPengajuan,
        "status_approval": statusApproval,
        "status_pengajuan": statusPengajuan,
        "status_pertanggungjawaban": statusPertanggungjawaban,
        "status_pencairan": statusPencairan,
        "jenis_pencairan": jenisPencairan,
        "tujuan": tujuan,
        "catatan_pengajuan": catatanPengajuan,
        "catatan_laporan": catatanLaporan,
        "catatan_pencairan": catatanPencairan,
        "nominal_pencairan": nominalPencairan,
        "nominal_realisasi": nominalRealisasi,
        "nominal_selisih": nominalSelisih,
        "additional_info": (additionalInfo != null)
            ? List<dynamic>.from(additionalInfo.map((x) => x.toJson()))
            : null,
        "id_perusahaan": idPerusahaan,
        // "pegawai": pegawai.toJson(),
        // "perusahaan": perusahaan.toJson(),
        // "department": department.toJson(),
        // "cabang": cabang.toJson(),
        // "kategori_pengajuan": kategoriPengajuan.toJson(),
        "rincian_pengajuan":
            List<dynamic>.from(rincianPengajuan.map((x) => x.toJson())),
        // "rincian_realisasi": List<dynamic>.from(rincianRealisasi.map((x) => x)),
      };

  @override
  String toString() {
    return '{ ${this.tujuan},${this.tglPengajuan},${this.statusApproval} }';
  }
}
