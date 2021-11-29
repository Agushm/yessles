part of 'models.dart';

SchoolLevel schoolLevelFromJson(String str) =>
    SchoolLevel.fromJson(json.decode(str));

String schoolLevelToJson(SchoolLevel data) => json.encode(data.toJson());

class SchoolLevel {
  SchoolLevel({this.id, this.jenjang, this.icon, this.kelas});

  int? id;
  String? icon;
  String? jenjang;
  List<Kelas>? kelas;

  factory SchoolLevel.fromJson(Map<String, dynamic> json) => SchoolLevel(
        id: json["id"],
        icon:json['icon'],
        jenjang: json["Jenjang"],
        kelas: List<Kelas>.from(json["kelas"].map((x) => Kelas.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Jenjang": jenjang,
        "kelas": List<dynamic>.from(kelas!.map((x) => x.toJson())),
      };
}

class Kelas {
  Kelas({
    this.id,
    this.kelas,
    this.jenjangId,
  });

  int? id;

  String? kelas;
  int? jenjangId;

  factory Kelas.fromJson(Map<String, dynamic> json) => Kelas(
        id: json["id"],
        kelas: json["kelas"],
        jenjangId: json["jenjang_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kelas": kelas,
        "jenjang_id": jenjangId,
      };
}
