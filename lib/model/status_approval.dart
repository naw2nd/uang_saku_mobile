class StatusApproval {
  StatusApproval({
    this.all,
    this.active,
    this.approved,
    this.progress,
  });

  List<int> all;
  int active;
  List<dynamic> approved;
  List<int> progress;

  factory StatusApproval.fromJson(Map<String, dynamic> json) => StatusApproval(
        all: List<int>.from(json["all"].map((x) => x)),
        active: json["active"],
        approved: List<dynamic>.from(json["approved"].map((x) => x)),
        progress: List<int>.from(json["progress"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "all": List<dynamic>.from(all.map((x) => x)),
        "active": active,
        "approved": List<dynamic>.from(approved.map((x) => x)),
        "progress": List<dynamic>.from(progress.map((x) => x)),
      };
}