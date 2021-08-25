part of 'models.dart';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher({
    this.id,
    this.kategoriId,
    this.nama,
    this.photo,
    this.deskripsi,
    this.phone,
    this.alamat,
    this.createdAt,
    this.totalRating,
    this.kategori,
    this.teacherName,
    this.teacherImage,
    this.teacherRating,
    this.teacherOnline,
    this.teacherAddress,
  });

  int? id;
  int? kategoriId;
  String? nama;
  String? photo;
  String? deskripsi;
  dynamic phone;
  dynamic alamat;
  DateTime? createdAt;
  double? totalRating;

  Kategori? kategori;
  String? teacherName;
  String? teacherImage;
  double? teacherRating;
  dynamic teacherOnline;
  String? teacherAddress;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"],
        kategoriId: json["kategori_id"],
        nama: json["nama"],
        photo: json["photo"],
        deskripsi: json["deskripsi"],
        phone: json["phone"],
        alamat: json["alamat"],
        createdAt: DateTime.parse(json["createdAt"]),
        totalRating: json["total_rating"] ?? 0,
        kategori: Kategori.fromJson(
          json["kategori"],
        ),
        teacherName: json["teacher_name"],
        teacherImage: json["teacher_image"],
        teacherRating: json["teacher_rating"] ?? 0,
        teacherOnline: json["teacher_online"],
        teacherAddress: json["teacher_address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "kategori_id": kategoriId,
        "nama": nama,
        "photo": photo,
        "deskripsi": deskripsi,
        "phone": phone,
        "alamat": alamat,
        "createdAt": createdAt!.toIso8601String(),
        "total_rating": totalRating,
        "kategori": kategori!.toJson(),
      };
}

class Kategori {
  Kategori({
    this.id,
    this.nama,
    this.ikon,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? nama;
  String? ikon;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
        id: json["id"],
        nama: json["nama"],
        ikon: json["ikon"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "ikon": ikon,
        "deletedAt": deletedAt,
      };
}
