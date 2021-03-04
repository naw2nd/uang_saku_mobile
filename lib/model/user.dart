import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class User extends Equatable {
  final int id;
  final String username;
  final String nama;
  final String email;
  final String alamat;
  final String noTelp;
  final String tempatLahir;
  final DateTime tglLahir;
  final String gender;

  User(
      {this.id,
      this.username,
      this.nama,
      this.email,
      this.alamat,
      this.noTelp,
      this.tempatLahir,
      this.tglLahir,
      this.gender});

  factory User.fromJson(Map<String, dynamic> json) {
    DateTime date = new DateFormat("yyyy-MM-dd").parse(json['tgl_lahir']);
    return User(
        username: json['username'],
        nama: json['nama_pegawai'],
        email: json['email'],
        alamat: json['alamat'],
        noTelp: json['no_telp'],
        tempatLahir: json['tempat_lahir'],
        tglLahir: date,
        gender: json['jenis_kelamin']);
  }

  @override
  List<Object> get props => [
        id,
        username,
        nama,
        email,
        alamat,
        noTelp,
        tempatLahir,
        tglLahir,
        gender
      ];
}
