class RequestImage64 {
  RequestImage64({
    this.idAttachmentRealisasiReimburse,
    this.action,
    this.idRincianRealisasi,
    this.image,
  });

  final int idAttachmentRealisasiReimburse;
  String action;
  final int idRincianRealisasi;
  String image;

  factory RequestImage64.fromJson(Map<String, dynamic> json) => RequestImage64(
        idAttachmentRealisasiReimburse:
            json["id_attachment_realisasi_reimburse"],
        idRincianRealisasi: json["id_rincian_realisasi"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id_attachment_realisasi_reimburse": idAttachmentRealisasiReimburse,
        "action": action ?? "",
        "id_rincian_realisasi": idRincianRealisasi,
        "image": image,
      };
}
