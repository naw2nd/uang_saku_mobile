import 'package:equatable/equatable.dart';
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User extends Equatable {
  User({
    this.idPegawai,
    this.namaPegawai,
    this.username,
    this.email,
    this.alamat,
    this.noTelp,
    this.tempatLahir,
    this.tglLahir,
    this.jenisKelamin,
    this.roles,
    this.approval,
  });

  int idPegawai;
  String namaPegawai;
  String username;
  String email;
  String alamat;
  String noTelp;
  String tempatLahir;
  DateTime tglLahir;
  String jenisKelamin;
  List<Role> roles;
  List<UserApproval> approval;

  factory User.fromJson(Map<String, dynamic> json) => User(
        idPegawai: json["id_pegawai"],
        namaPegawai: json["nama_pegawai"],
        username: json["username"],
        email: json["email"],
        alamat: json["alamat"],
        noTelp: json["no_telp"],
        tempatLahir: json["tempat_lahir"],
        tglLahir: DateTime.parse(json["tgl_lahir"]),
        jenisKelamin: json["jenis_kelamin"],
        roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
        approval: List<UserApproval>.from(
            json["approval"].map((x) => UserApproval.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id_pegawai": idPegawai,
        "nama_pegawai": namaPegawai,
        "username": username,
        "email": email,
        "alamat": alamat,
        "no_telp": noTelp,
        "tempat_lahir": tempatLahir,
        "tgl_lahir":
            "${tglLahir.year.toString().padLeft(4, '0')}-${tglLahir.month.toString().padLeft(2, '0')}-${tglLahir.day.toString().padLeft(2, '0')}",
        "jenis_kelamin": jenisKelamin,
        "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "approval": List<dynamic>.from(approval.map((x) => x.toJson())),
      };

  bool isApproval() {
    bool value = false;
    roles.forEach((element) {
      if (element.idRole == 2) value = true;
    });

    return value;
  }

  @override
  List<Object> get props => [
        idPegawai,
        namaPegawai,
        username,
        email,
        alamat,
        noTelp,
        tempatLahir,
        tglLahir,
        jenisKelamin,
        roles,
        approval,
      ];
}

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