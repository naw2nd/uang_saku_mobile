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
