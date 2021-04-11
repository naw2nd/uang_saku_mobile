
class Role {
  Role({
    this.idRole,
    this.namaRole,
    this.status,
  });

  int idRole;
  String namaRole;
  int status;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        idRole: json["id_role"],
        namaRole: json["nama_role"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_role": idRole,
        "nama_role": namaRole,
        "status": status,
      };
}