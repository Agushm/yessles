part of 'models.dart';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());

class Teacher {
  Teacher(
      {this.id,
      required this.nama,
      required this.photo,
      required this.deskripsi,
      required this.phone,
      required this.alamat,
      this.createdAt,
      required this.totalRating,
      this.jadwal});

  late final int? id;
  late final int kategoriId;
  late final String nama;
  late final String photo;
  late final String deskripsi;
  late final dynamic phone;
  late final dynamic alamat;
  late final DateTime? createdAt;
  late final double totalRating;
  late final List<Schedule>? jadwal;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
      id: json["id"],
      nama: json["nama"],
      photo: json["photo"],
      deskripsi: json["deskripsi"],
      phone: json["phone"],
      alamat: json["alamat"] ?? '',
      createdAt:
          json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
      totalRating: json["total_rating"] == null
          ? 0
          : double.parse(json["total_rating"].toString()),
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
