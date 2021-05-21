// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'package:uang_saku/model/models.dart';
import 'package:uang_saku/model/approval.dart';

class Laporan {
  Laporan({
    this.catatanLaporan,
    this.rincianRealisasi,
  });

  final String catatanLaporan;
  final List<RincianRealisasi> rincianRealisasi;

  Map<String, dynamic> toJson() => {
        "catatan_laporan": catatanLaporan,
        "rincian_realisasi": List<dynamic>.from(rincianRealisasi.map((x) => x.toJson()))
      };
}
