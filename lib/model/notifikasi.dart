import 'package:uang_saku/model/pegawai.dart';

class Notifikasi {
  final int id;
  final String title;
  final String message;
  final String day;
  final String time;

  Notifikasi({this.id, this.title, this.message, this.time, this.day});
  factory Notifikasi.fromMap(Map<String, dynamic> map) => Notifikasi(
        id: map['id'],
        title: map['title'],
        message: map['message'],
        day: map['day'],
        time: map['time'],
      );

  Map<String, dynamic> toMap() => {
    "id" : id,
    "title" : title,
    "message": message,
    "day": day,
    "time": time,
  };
}
