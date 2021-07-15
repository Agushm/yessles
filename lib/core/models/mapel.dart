part of 'models.dart';

Mapel mapelFromJson(String str) => Mapel.fromJson(json.decode(str));

String mapelToJson(Mapel data) => json.encode(data.toJson());

class Mapel {
  Mapel({
    this.name,
    this.desc,
    this.rating,
    this.listImage,
    this.teacher,
  });

  String? name;
  String? desc;
  double? rating;
  List<String>? listImage;
  Teacher? teacher;

  factory Mapel.fromJson(Map<String, dynamic> json) => Mapel(
        name: json["name"],
        desc: json['desc'],
        rating: json["rating"].toDouble(),
        listImage: List<String>.from(json["listImage"].map((x) => x)),
        teacher: Teacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "rating": rating,
        "listImage": List<dynamic>.from(listImage!.map((x) => x)),
        "teacher": teacher!.toJson(),
      };
}

class Teacher {
  Teacher({
    this.teacherName,
    this.teacherImage,
    this.teacherRating,
    this.teacherOnline,
    this.teacherAddress,
  });

  String? teacherName;
  String? teacherImage;
  double? teacherRating;
  dynamic teacherOnline;
  String? teacherAddress;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        teacherName: json["teacher_name"],
        teacherImage: json["teacher_image"],
        teacherRating: json["teacher_rating"].toDouble(),
        teacherOnline: json["teacher_online"],
        teacherAddress: json["teacher_address"],
      );

  Map<String, dynamic> toJson() => {
        "teacher_name": teacherName,
        "teacher_image": teacherImage,
        "teacher_rating": teacherRating,
        "teacher_online": teacherOnline,
        "teacher_address": teacherAddress,
      };
}
