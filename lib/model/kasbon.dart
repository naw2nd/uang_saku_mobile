// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:uang_saku/model/models.dart';

// Kasbon kasbonFromJson(String str) => Kasbon.fromJson(json.decode(str));
// String kasbonToJson(Kasbon data) => json.encode(data.toJson());

// class ListKasbon {
//   ListKasbon({
//     this.success,
//     this.message,
//     // this.properties,
//     this.data,
//   });

//   bool success;
//   String message;
//   //Properties properties;
//   List<Kasbon> data;

//   factory ListKasbon.fromJson(Map<String, dynamic> json) => ListKasbon(
//         success: json["success"],
//         message: json["message"],
//         //properties: Properties.fromJson(json["properties"]),
//         data: List<Kasbon>.from(json["data"].map((x) => Kasbon.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         //"properties": properties.toJson(),
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//       };

//   @override
//   String toString() {
//     return '{ ${this.data} }';
//   }
// }

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
  Approval approval;
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
        approval: Approval.fromJson(json["approval"]),
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
        // rincianPengajuan: List<RincianPengajuan>.from(
        //     json["rincian_pengajuan"].map((x) => RincianPengajuan.fromJson(x))),
        // rincianRealisasi:
        //     List<dynamic>.from(json["rincian_realisasi"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id_pengajuan_kasbon": idPengajuanKasbon,
        "id_pegawai": idPegawai,
        "id_department": idDepartment,
        "id_cabang": idCabang,
        "id_kategori_pengajuan": idKategoriPengajuan,
        "pelaksana": List<dynamic>.from(pelaksana.map((x) => x)),
        "approval": approval.toJson(),
        "tgl_pengajuan":
            "${tglPengajuan.year.toString().padLeft(4, '0')}-${tglPengajuan.month.toString().padLeft(2, '0')}-${tglPengajuan.day.toString().padLeft(2, '0')}",
        "tgl_pencairan": tglPencairan,
        "tgl_totalan":
            "${tglTotalan.year.toString().padLeft(4, '0')}-${tglTotalan.month.toString().padLeft(2, '0')}-${tglTotalan.day.toString().padLeft(2, '0')}",
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
        "additional_info":
            List<dynamic>.from(additionalInfo.map((x) => x.toJson())),
        "id_perusahaan": idPerusahaan,
        "pegawai": pegawai.toJson(),
        "perusahaan": perusahaan.toJson(),
        "department": department.toJson(),
        "cabang": cabang.toJson(),
        "kategori_pengajuan": kategoriPengajuan.toJson(),
        "rincian_pengajuan":
            List<dynamic>.from(rincianPengajuan.map((x) => x.toJson())),
        "rincian_realisasi": List<dynamic>.from(rincianRealisasi.map((x) => x)),
      };

  @override
  String toString() {
    return '{ ${this.tujuan},${this.tglPengajuan},${this.statusApproval} }';
  }
}

class AdditionalInfo {
  AdditionalInfo({
    this.label,
    this.value,
  });

  String label;
  String value;

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
        label: json["label"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "value": value,
      };
}

class Approval {
  Approval({
    this.all,
    this.active,
    this.approved,
    this.progress,
  });

  List<int> all;
  int active;
  List<dynamic> approved;
  List<int> progress;

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        all: List<int>.from(json["all"].map((x) => x)),
        active: json["active"],
        approved: List<dynamic>.from(json["approved"].map((x) => x)),
        progress: List<int>.from(json["progress"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "all": List<dynamic>.from(all.map((x) => x)),
        "active": active,
        "approved": List<dynamic>.from(approved.map((x) => x)),
        "progress": List<dynamic>.from(progress.map((x) => x)),
      };
}

class Cabang {
  Cabang({
    this.idCabang,
    this.namaCabang,
  });

  int idCabang;
  String namaCabang;

  factory Cabang.fromJson(Map<String, dynamic> json) => Cabang(
        idCabang: json["id_cabang"],
        namaCabang: json["nama_cabang"],
      );

  Map<String, dynamic> toJson() => {
        "id_cabang": idCabang,
        "nama_cabang": namaCabang,
      };
}

class Department {
  Department({
    this.idDepartment,
    this.namaDepartment,
  });

  int idDepartment;
  String namaDepartment;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        idDepartment: json["id_department"],
        namaDepartment: json["nama_department"],
      );

  Map<String, dynamic> toJson() => {
        "id_department": idDepartment,
        "nama_department": namaDepartment,
      };
}

class KategoriPengajuan {
  KategoriPengajuan({
    this.idKategoriPengajuan,
    this.namaKategoriPengajuan,
  });

  int idKategoriPengajuan;
  String namaKategoriPengajuan;

  factory KategoriPengajuan.fromJson(Map<String, dynamic> json) =>
      KategoriPengajuan(
        idKategoriPengajuan: json["id_kategori_pengajuan"],
        namaKategoriPengajuan: json["nama_kategori_pengajuan"],
      );

  Map<String, dynamic> toJson() => {
        "id_kategori_pengajuan": idKategoriPengajuan,
        "nama_kategori_pengajuan": namaKategoriPengajuan,
      };
}

class Pegawai {
  Pegawai({
    this.idPegawai,
    this.namaPegawai,
  });

  int idPegawai;
  String namaPegawai;

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        idPegawai: json["id_pegawai"],
        namaPegawai: json["nama_pegawai"],
      );

  Map<String, dynamic> toJson() => {
        "id_pegawai": idPegawai,
        "nama_pegawai": namaPegawai,
      };
}

class Perusahaan {
  Perusahaan({
    this.idPerusahaan,
    this.namaPerusahaan,
  });

  int idPerusahaan;
  String namaPerusahaan;

  factory Perusahaan.fromJson(Map<String, dynamic> json) => Perusahaan(
        idPerusahaan: json["id_perusahaan"],
        namaPerusahaan: json["nama_perusahaan"],
      );

  Map<String, dynamic> toJson() => {
        "id_perusahaan": idPerusahaan,
        "nama_perusahaan": namaPerusahaan,
      };
}

// List<RincianPengajuan> convertFromJson(String str) =>
//     List<RincianPengajuan>.from(
//         json.decode(str).map((x) => RincianPengajuan.fromJson(x)));

// String convertToJson(List<RincianPengajuan> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RincianPengajuan {
  RincianPengajuan({
    this.idRincianPengajuanKasbon,
    this.idPengajuanKasbon,
    this.idKategoriBiaya,
    this.namaItem,
    this.jumlahUnit,
    this.hargaSatuan,
    this.total,
    this.keterangan,
    this.images,
    this.kategoriBiaya,
  });

  int idRincianPengajuanKasbon;
  int idPengajuanKasbon;
  int idKategoriBiaya;
  String namaItem;
  int jumlahUnit;
  int hargaSatuan;
  int total;
  dynamic keterangan;
  List<dynamic> images;
  KategoriBiaya kategoriBiaya;

  factory RincianPengajuan.fromJson(Map<String, dynamic> json) =>
      RincianPengajuan(
        idRincianPengajuanKasbon: json["id_rincian_pengajuan_kasbon"] as int,
        idPengajuanKasbon: json["id_pengajuan_kasbon"] as int,
        idKategoriBiaya: json["id_kategori_biaya"] as int,
        namaItem: json["nama_item"] as String,
        jumlahUnit: json["jumlah_unit"] as int,
        hargaSatuan: json["harga_satuan"] as int,
        total: json["total"] as int,
        keterangan: json["keterangan"] as String,
        images: List<dynamic>.from(json["images"].map((x) => x)),
        kategoriBiaya: KategoriBiaya.fromJson(json["kategori_biaya"]),
      );

  Map<String, dynamic> toJson() => {
        "id_rincian_pengajuan_kasbon": idRincianPengajuanKasbon,
        "id_pengajuan_kasbon": idPengajuanKasbon,
        "id_kategori_biaya": idKategoriBiaya,
        "nama_item": namaItem,
        "jumlah_unit": jumlahUnit,
        "harga_satuan": hargaSatuan,
        "total": total,
        "keterangan": keterangan,
        "images": List<dynamic>.from(images.map((x) => x)),
        "kategori_biaya": kategoriBiaya.toJson(),
      };

  @override
  String toString() {
    return '{ ${this.namaItem}, ${this.total} }';
  }
}

class KategoriBiaya {
  KategoriBiaya({
    this.idKategoriBiaya,
    this.namaKategoriBiaya,
  });

  int idKategoriBiaya;
  String namaKategoriBiaya;

  factory KategoriBiaya.fromJson(Map<String, dynamic> json) => KategoriBiaya(
        idKategoriBiaya: json["id_kategori_biaya"],
        namaKategoriBiaya: json["nama_kategori_biaya"],
      );

  Map<String, dynamic> toJson() => {
        "id_kategori_biaya": idKategoriBiaya,
        "nama_kategori_biaya": namaKategoriBiaya,
      };
}
