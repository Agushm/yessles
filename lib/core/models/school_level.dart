part of 'models.dart';

SchoolLevel schoolLevelFromJson(String str) =>
    SchoolLevel.fromJson(json.decode(str));

String schoolLevelToJson(SchoolLevel data) => json.encode(data.toJson());

class SchoolLevel {
  SchoolLevel({
    this.id,
    this.jenjang,
  });

  int? id;
  String? jenjang;

  factory SchoolLevel.fromJson(Map<String, dynamic> json) => SchoolLevel(
        id: json["id"],
        jenjang: json["Jenjang"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "Jenjang": jenjang,
      };
}
