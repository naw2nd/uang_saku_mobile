import 'package:equatable/equatable.dart';
// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:uang_saku/model/role.dart';
import 'package:uang_saku/model/user_approval.dart';

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

  final int idPegawai;
  final String namaPegawai;
  final String username;
  final String email;
  final String alamat;
  final String noTelp;
  final String tempatLahir;
  final DateTime tglLahir;
  final String jenisKelamin;
  final List<Role> roles;
  final List<UserApproval> approval;

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
