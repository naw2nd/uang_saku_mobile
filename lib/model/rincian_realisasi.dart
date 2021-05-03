import 'models.dart';

class RincianRealisasi {
  RincianRealisasi({
    this.idRincianRealisasiReimburse,
    this.action,
    this.idPengajuanReimburse,
    this.idKategoriBiaya,
    this.namaItem,
    this.total,
    this.keterangan,
    this.kategoriBiaya,
    this.images,
  });

  final int idRincianRealisasiReimburse;
  String action;
  final int idPengajuanReimburse;
  final int idKategoriBiaya;
  final String namaItem;
  int total;
  final String keterangan;
  final KategoriBiaya kategoriBiaya;
  final List<RequestImage64> images;

  factory RincianRealisasi.fromJson(Map<String, dynamic> json) =>
      RincianRealisasi(
        idRincianRealisasiReimburse: json["id_rincian_realisasi_reimburse"],
        idPengajuanReimburse: json["id_pengajuan_reimburse"],
        idKategoriBiaya: json["id_kategori_biaya"],
        namaItem: json["nama_item"],
        total: json["total"],
        keterangan: json["keterangan"],
        kategoriBiaya: KategoriBiaya.fromJson(json["kategori_biaya"]),
        images: List<RequestImage64>.from(
            json["images"].map((x) => RequestImage64.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_rincian_realisasi_reimburse": idRincianRealisasiReimburse,
        "id_pengajuan_reimburse": idPengajuanReimburse,
        "id_kategori_biaya": idKategoriBiaya,
        "action": action,
        "nama_item": namaItem,
        "total": total,
        "keterangan": keterangan,
        // "kategori_biaya": kategoriBiaya.toJson(),
        "images":
            (images != null) ? List<dynamic>.from(images.map((x) => x)) : "",
      };
}
