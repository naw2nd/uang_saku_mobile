//masih belum selesai
class AdditionalInfo {
  AdditionalInfo({
    this.lokasi,
  });

  final String lokasi;

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => AdditionalInfo(
        lokasi: json["lokasi"],
      );

  Map<String, dynamic> toJson() => {
        "lokasi": lokasi,
      };
}
