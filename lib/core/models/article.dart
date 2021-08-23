part of 'models.dart';

Article articleFromJson(String str) => Article.fromJson(json.decode(str));

String articleToJson(Article data) => json.encode(data.toJson());

class Article {
  Article({
    this.id,
    this.judul,
    this.deskripsi,
    this.thumbnail,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? judul;
  String? deskripsi;
  String? thumbnail;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        judul: json["judul"],
        deskripsi: json["deskripsi"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul": judul,
        "deskripsi": deskripsi,
        "thumbnail": thumbnail,
        "status": status,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
