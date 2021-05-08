// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/approval.dart';

class Kasbon {
  Kasbon({
    this.idPengajuanKasbon,
    this.idPegawai,
    this.idDepartment,
    this.idCabang,
    this.idKategoriPengajuan,
    this.pelaksana,
    this.tglPengajuan,
    this.tglPencairan,
    this.tglTotalan,
    this.tglMulai,
    this.tglSelesai,
    this.nomorPengajuan,
    this.approval,
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

  final int idPengajuanKasbon;
  final int idPegawai;
  final int idDepartment;
  final int idCabang;
  final int idKategoriPengajuan;
  final List<String> pelaksana;
  final DateTime tglPengajuan;
  final DateTime tglPencairan;
  final DateTime tglTotalan;
  final DateTime tglMulai;
  final DateTime tglSelesai;
  final String nomorPengajuan;
  final Approval approval;
  final String statusApproval;
  final int statusPengajuan;
  final int statusPertanggungjawaban;
  final int statusPencairan;
  final String jenisPencairan;
  final String tujuan;
  final String catatanPengajuan;
  final String catatanLaporan;
  final String catatanPencairan;
  final int nominalPencairan;
  final int nominalRealisasi;
  final int nominalSelisih;
  final List<AdditionalInfo> additionalInfo;
  final int idPerusahaan;
  final Pegawai pegawai;
  final Perusahaan perusahaan;
  final Department department;
  final Cabang cabang;
  final KategoriPengajuan kategoriPengajuan;
  final List<RincianPengajuan> rincianPengajuan;
  final List<RincianRealisasi> rincianRealisasi;

  factory Kasbon.fromJson(Map<String, dynamic> json) => Kasbon(
        idPengajuanKasbon: json["id_pengajuan_kasbon"],
        idPegawai: json["id_pegawai"],
        idDepartment: json["id_department"],
        idCabang: json["id_cabang"],
        idKategoriPengajuan: json["id_kategori_pengajuan"],
        pelaksana: List<String>.from(json["pelaksana"].map((x) => x)),
        approval: Approval.fromJson(json["approval"]),
        statusApproval: json["status_approval"],
        tglPengajuan: DateTime.parse(json["tgl_pengajuan"]),
        // tglPencairan: DateTime.parse(json["tgl_pencairan"]),
        tglTotalan: DateTime.parse(json["tgl_totalan"]),
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        tglSelesai: DateTime.parse(json["tgl_selesai"]),
        nomorPengajuan: json["nomor_pengajuan"],
        statusPengajuan: json["status_pengajuan"],
        statusPertanggungjawaban: json["status_pertanggungjawaban"],
        statusPencairan: json["status_pencairan"],
        jenisPencairan: json["jenis_pencairan"],
        tujuan: json["tujuan"],
        catatanPengajuan: json["catatan_pengajuan"],
        catatanLaporan: json["catatan_laporan"],
        catatanPencairan: json["catatan_pencairan"],
        nominalPencairan: json["nominal_pencairan"],
        nominalRealisasi: json["nominal_realisasi"],
        nominalSelisih: json["nominal_selisih"],
        // additionalInfo: List<AdditionalInfo>.from(
        //     json["additional_info"].map((x) => AdditionalInfo.fromJson(x))),
        pegawai: (json["pegawai"] == null)
            ? null
            : Pegawai.fromJson(json["pegawai"]),
        perusahaan: (json["perusahaan"] == null)
            ? null
            : Perusahaan.fromJson(json["perusahaan"]),
        department: (json["department"] == null)
            ? null
            : Department.fromJson(json["department"]),
        cabang: json["cabang"] == null ? null : Cabang.fromJson(json["cabang"]),
        idPerusahaan: json["id_perusahaan"],
        // pegawai: Pegawai.fromJson(json["pegawai"]),
        // perusahaan: Perusahaan.fromJson(json["perusahaan"]),
        // department: Department.fromJson(json["department"]),
        // cabang: Cabang.fromJson(json["cabang"]),
        kategoriPengajuan:
            KategoriPengajuan.fromJson(json["kategori_pengajuan"]),
        rincianPengajuan: (json["rincian_pengajuan"] != null)
            ? List<RincianPengajuan>.from(json["rincian_pengajuan"]
                .map((x) => RincianPengajuan.fromJson(x)))
            : null,
        rincianRealisasi: (json["rincian_realisasi"] != null)
            ? List<RincianRealisasi>.from(json["rincian_realisasi"]
                .map((x) => RincianRealisasi.fromJson(x)))
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id_pengajuan_kasbon": idPengajuanKasbon,
        "id_pegawai": idPegawai,
        "id_department": idDepartment,
        "id_cabang": idCabang,
        "id_kategori_pengajuan": idKategoriPengajuan,
        "pelaksana": List<String>.from(pelaksana.map((x) => x)),
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
        "status_approval": approval,
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
        "rincian_realisasi": (additionalInfo != null)
            ? List<dynamic>.from(rincianRealisasi.map((x) => x.toJson()))
            : null,
      };

  @override
  String toString() {
    return '{ ${this.tujuan},${this.tglPengajuan},${this.approval} }';
  }
}
