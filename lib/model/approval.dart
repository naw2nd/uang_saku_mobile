class Approval {
  Approval({
    this.all,
    this.active,
    this.approved,
    this.progress,
    // this.keterangan
  });

  List<int> all;
  int active;
  List<int> approved;
  List<int> progress;
  List<String> keterangan = [
    "",
    "Korcab",
    "Supervisor",
    "Keuangan",
    "Direktur"
  ];
  factory Approval.fromJson(Map<String, dynamic> json) => Approval(
        all: List<int>.from(json["all"].map((x) => x)),
        active: json["active"],
        approved: List<int>.from(json["approved"].map((x) => x)),
        progress: List<int>.from(json["progress"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "all": List<int>.from(all.map((x) => x)),
        "active": active,
        "approved": List<int>.from(approved.map((x) => x)),
        "progress": List<int>.from(progress.map((x) => x)),
      };
}
