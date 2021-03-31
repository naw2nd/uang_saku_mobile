// To parse this JSON data, do
//
//     final reimburse = reimburseFromJson(jsonString);

import 'dart:convert';
import 'models.dart';
import 'package:equatable/equatable.dart';

Reimburse reimburseFromJson(String str) => Reimburse.fromJson(json.decode(str));

String reimburseToJson(Reimburse data) => json.encode(data.toJson());

class Reimburse extends Equatable{
    Reimburse({
        this.idPengajuanReimburse,
        this.idPegawai,
        this.idDepartment,
        this.idCabang,
        this.idKategoriPengajuan,
        this.pelaksana,
        this.statusApproval,
        this.tglPengajuan,
        this.tglPencairan,
        this.tglMulai,
        this.tglSelesai,
        this.nomorPengajuan,
        this.statusPengajuan,
        this.statusPencairan,
        this.jenisPencairan,
        this.tujuan,
        this.catatan,
        this.catatanPencairan,
        this.nominalRealisasi,
        this.additionalInfo,
        this.idPerusahaan,
        this.pegawai,
        this.perusahaan,
        this.department,
        this.cabang,
        this.kategoriPengajuan,
        this.rincianRealisasi,
    });

    final int idPengajuanReimburse;
    final int idPegawai;
    final int idDepartment;
    final int idCabang;
    final int idKategoriPengajuan;
    final List<String> pelaksana;
    final String statusApproval;
    final DateTime tglPengajuan;
    final dynamic tglPencairan;
    final DateTime tglMulai;
    final DateTime tglSelesai;
    final String nomorPengajuan;
    final int statusPengajuan;
    final int statusPencairan;
    final String jenisPencairan;
    final String tujuan;
    final String catatan;
    final dynamic catatanPencairan;
    final int nominalRealisasi;
    final List<AdditionalInfo> additionalInfo;
    final int idPerusahaan;
    final Pegawai pegawai;
    final Perusahaan perusahaan;
    final Department department;
    final Cabang cabang;
    final KategoriPengajuan kategoriPengajuan;
    final RincianRealisasi rincianRealisasi;

    factory Reimburse.fromJson(Map<String, dynamic> json) => Reimburse(
        idPengajuanReimburse: json["id_pengajuan_reimburse"],
        idPegawai: json["id_pegawai"],
        idDepartment: json["id_department"],
        idCabang: json["id_cabang"],
        idKategoriPengajuan: json["id_kategori_pengajuan"],
        pelaksana: List<String>.from(json["pelaksana"].map((x) => x)),
        statusApproval: json["approval"],
        tglPengajuan: DateTime.parse(json["tgl_pengajuan"]),
        tglPencairan: json["tgl_pencairan"],
        tglMulai: DateTime.parse(json["tgl_mulai"]),
        tglSelesai: DateTime.parse(json["tgl_selesai"]),
        nomorPengajuan: json["nomor_pengajuan"],
        statusPengajuan: json["status_pengajuan"],
        statusPencairan: json["status_pencairan"],
        jenisPencairan: json["jenis_pencairan"],
        tujuan: json["tujuan"],
        catatan: json["catatan"],
        catatanPencairan: json["catatan_pencairan"],
        nominalRealisasi: json["nominal_realisasi"],
        additionalInfo: List<AdditionalInfo>.from(json["additional_info"].map((x) => AdditionalInfo.fromJson(x))),
        idPerusahaan: json["id_perusahaan"],
        pegawai: Pegawai.fromJson(json["pegawai"]),
        perusahaan: Perusahaan.fromJson(json["perusahaan"]),
        department: Department.fromJson(json["department"]),
        cabang: Cabang.fromJson(json["cabang"]),
        kategoriPengajuan: KategoriPengajuan.fromJson(json["kategori_pengajuan"]),
        rincianRealisasi: RincianRealisasi.fromJson(json["rincian_realisasi"]),
    );

    Map<String, dynamic> toJson() => {
        "id_pengajuan_reimburse": idPengajuanReimburse,
        "id_pegawai": idPegawai,
        "id_department": idDepartment,
        "id_cabang": idCabang,
        "id_kategori_pengajuan": idKategoriPengajuan,
        "pelaksana": List<dynamic>.from(pelaksana.map((x) => x)),
        "approval": statusApproval,
        "tgl_pengajuan": "${tglPengajuan.year.toString().padLeft(4, '0')}-${tglPengajuan.month.toString().padLeft(2, '0')}-${tglPengajuan.day.toString().padLeft(2, '0')}",
        "tgl_pencairan": tglPencairan,
        "tgl_mulai": "${tglMulai.year.toString().padLeft(4, '0')}-${tglMulai.month.toString().padLeft(2, '0')}-${tglMulai.day.toString().padLeft(2, '0')}",
        "tgl_selesai": "${tglSelesai.year.toString().padLeft(4, '0')}-${tglSelesai.month.toString().padLeft(2, '0')}-${tglSelesai.day.toString().padLeft(2, '0')}",
        "nomor_pengajuan": nomorPengajuan,
        "status_pengajuan": statusPengajuan,
        "status_pencairan": statusPencairan,
        "jenis_pencairan": jenisPencairan,
        "tujuan": tujuan,
        "catatan": catatan,
        "catatan_pencairan": catatanPencairan,
        "nominal_realisasi": nominalRealisasi,
        "additional_info": List<dynamic>.from(additionalInfo.map((x) => x.toJson())),
        "id_perusahaan": idPerusahaan,
        "pegawai": pegawai.toJson(),
        "perusahaan": perusahaan.toJson(),
        "department": department.toJson(),
        "cabang": cabang.toJson(),
        "kategori_pengajuan": kategoriPengajuan.toJson(),
        "rincian_realisasi": rincianRealisasi.toJson(),
    };

  @override
  List<Object> get props => [];
}