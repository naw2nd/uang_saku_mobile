import 'package:uang_saku/model/pegawai.dart';

class Notifikasi {
  final int id;
  final String title;
  final String message;
  final DateTime time = DateTime.now();

  Notifikasi({this.id, this.title, this.message});
  factory Notifikasi.fromMap(Map<String, dynamic> map) => Notifikasi(
        id: map['id'],
        title: map['title'],
        message: map['message'],
      );

  Map<String, dynamic> toMap() => {
    "id" : id,
    "title" : title,
    "message": message
  };
}
