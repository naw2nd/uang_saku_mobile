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
  List<Approval> approval;

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
        approval: List<Approval>.from(
            json["approval"].map((x) => Approval.fromJson(x))),
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

class Approval {
  Approval({
    this.idApproval,
    this.namaApproval,
    this.status,
  });

  int idApproval;
  String namaApproval;
  int status;

  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
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

// class User extends Equatable {
//   final int id;
//   final String username;
//   final String nama;
//   final String email;
//   final String alamat;
//   final String noTelp;
//   final String tempatLahir;
//   final DateTime tglLahir;
//   final String gender;

//   User(
//       {this.id,
//       this.username,
//       this.nama,
//       this.email,
//       this.alamat,
//       this.noTelp,
//       this.tempatLahir,
//       this.tglLahir,
//       this.gender});

//   factory User.fromJson(Map<String, dynamic> json) {
//     DateTime date = new DateFormat("yyyy-MM-dd").parse(json['tgl_lahir']);
//     return User(
//         username: json['username'],
//         nama: json['nama_pegawai'],
//         email: json['email'],
//         alamat: json['alamat'],
//         noTelp: json['no_telp'],
//         tempatLahir: json['tempat_lahir'],
//         tglLahir: date,
//         gender: json['jenis_kelamin']);
//   }

//   @override
//   List<Object> get props => [
//         id,
//         username,
//         nama,
//         email,
//         alamat,
//         noTelp,
//         tempatLahir,
//         tglLahir,
//         gender
//       ];
// }
