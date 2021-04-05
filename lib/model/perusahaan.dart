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
