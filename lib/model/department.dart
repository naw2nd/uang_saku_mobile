class Department {
  Department({
    this.idDepartment,
    this.namaDepartment,
  });

  final int idDepartment;
  final String namaDepartment;

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        idDepartment: json["id_department"],
        namaDepartment: json["nama_department"],
      );

  Map<String, dynamic> toJson() => {
        "id_department": idDepartment,
        "nama_department": namaDepartment,
      };
}
