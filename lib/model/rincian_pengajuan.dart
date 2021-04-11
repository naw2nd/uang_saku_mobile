import 'kategori_biaya.dart';

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