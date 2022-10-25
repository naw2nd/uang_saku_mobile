//user approval dari API GET USER
class UserApproval {
  UserApproval({
    this.idApproval,
    this.namaApproval,
    this.status,
  });

  int idApproval;
  String namaApproval;
  int status;

  factory UserApproval.fromJson(Map<String, dynamic> json) => UserApproval(
        idApproval: json["id_approval"],
        namaApproval: json["nama_approval"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id_approval": idApproval,
        "nama_approval": namaApproval,
        "status": status,
      };
}
