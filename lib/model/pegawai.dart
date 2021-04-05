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