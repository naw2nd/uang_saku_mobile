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
