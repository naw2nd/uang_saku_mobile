//belum terpakai
class KategoriPengajuan {
  KategoriPengajuan({
    this.idKategoriPengajuan,
    this.namaKategoriPengajuan,
  });

  final int idKategoriPengajuan;
  final String namaKategoriPengajuan;

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
