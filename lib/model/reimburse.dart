// To parse this JSON data, do
//
//     final reimburse = reimburseFromJson(jsonString);

import 'dart:convert';

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
     String tujuan;
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

class AdditionalInfo {
    AdditionalInfo({
        this.lokasi,
    });

    final String lokasi;

    factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
        lokasi: json["lokasi"],
    );

    Map<String, dynamic> toJson() => {
        "lokasi": lokasi,
    };
}

class Cabang {
    Cabang({
        this.idCabang,
        this.namaCabang,
    });

    final int idCabang;
    final String namaCabang;

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

    final int idDepartment;
    final String namaDepartment;

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

    final int idKategoriPengajuan;
    final String namaKategoriPengajuan;

    factory KategoriPengajuan.fromJson(Map<String, dynamic> json) => KategoriPengajuan(
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

    final int idPegawai;
    final String namaPegawai;

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

    final int idPerusahaan;
    final String namaPerusahaan;

    factory Perusahaan.fromJson(Map<String, dynamic> json) => Perusahaan(
        idPerusahaan: json["id_perusahaan"],
        namaPerusahaan: json["nama_perusahaan"],
    );

    Map<String, dynamic> toJson() => {
        "id_perusahaan": idPerusahaan,
        "nama_perusahaan": namaPerusahaan,
    };
}

class RincianRealisasi {
    RincianRealisasi({
        this.idRincianRealisasiReimburse,
        this.idPengajuanReimburse,
        this.idKategoriBiaya,
        this.namaItem,
        this.total,
        this.keterangan,
        this.kategoriBiaya,
        this.images,
    });

    final int idRincianRealisasiReimburse;
    final int idPengajuanReimburse;
    final int idKategoriBiaya;
    final String namaItem;
    final int total;
    final String keterangan;
    final KategoriBiaya kategoriBiaya;
    final Images images;

    factory RincianRealisasi.fromJson(Map<String, dynamic> json) => RincianRealisasi(
        idRincianRealisasiReimburse: json["id_rincian_realisasi_reimburse"],
        idPengajuanReimburse: json["id_pengajuan_reimburse"],
        idKategoriBiaya: json["id_kategori_biaya"],
        namaItem: json["nama_item"],
        total: json["total"],
        keterangan: json["keterangan"],
        kategoriBiaya: KategoriBiaya.fromJson(json["kategori_biaya"]),
        images: Images.fromJson(json["images"]),
    );

    Map<String, dynamic> toJson() => {
        "id_rincian_realisasi_reimburse": idRincianRealisasiReimburse,
        "id_pengajuan_reimburse": idPengajuanReimburse,
        "id_kategori_biaya": idKategoriBiaya,
        "nama_item": namaItem,
        "total": total,
        "keterangan": keterangan,
        "kategori_biaya": kategoriBiaya.toJson(),
        "images": images.toJson(),
    };
}

class Images {
    Images({
        this.idAttachmentRealisasiReimburse,
        this.idRincianRealisasi,
        this.image,
    });

    final int idAttachmentRealisasiReimburse;
    final int idRincianRealisasi;
    final String image;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        idAttachmentRealisasiReimburse: json["id_attachment_realisasi_reimburse"],
        idRincianRealisasi: json["id_rincian_realisasi"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id_attachment_realisasi_reimburse": idAttachmentRealisasiReimburse,
        "id_rincian_realisasi": idRincianRealisasi,
        "image": image,
    };
}

class KategoriBiaya {
    KategoriBiaya({
        this.idKategoriBiaya,
        this.namaKategoriBiaya,
    });

    final int idKategoriBiaya;
    final String namaKategoriBiaya;

    factory KategoriBiaya.fromJson(Map<String, dynamic> json) => KategoriBiaya(
        idKategoriBiaya: json["id_kategori_biaya"],
        namaKategoriBiaya: json["nama_kategori_biaya"],
    );

    Map<String, dynamic> toJson() => {
        "id_kategori_biaya": idKategoriBiaya,
        "nama_kategori_biaya": namaKategoriBiaya,
    };
}
