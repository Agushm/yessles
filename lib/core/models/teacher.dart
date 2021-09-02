part of 'models.dart';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher(
      {this.id,
      this.nama,
      this.photo,
      this.deskripsi,
      this.phone,
      this.alamat,
      this.createdAt,
      this.totalRating,
      this.jadwal});

  int? id;
  int? kategoriId;
  String? nama;
  String? photo;
  String? deskripsi;
  dynamic phone;
  dynamic alamat;
  DateTime? createdAt;
  double? totalRating;
  List<Schedule>? jadwal;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
      id: json["id"],
      nama: json["nama"],
      photo: json["photo"],
      deskripsi: json["deskripsi"],
      phone: json["phone"],
      alamat: json["alamat"] ?? '',
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      totalRating:
          json["total_rating"] == null ? 0 : double.parse(json["total_rating"]),
      jadwal: []);

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
      };
}
