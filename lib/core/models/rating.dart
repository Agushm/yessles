part of 'models.dart';

Rating ratingFromJson(String str) => Rating.fromJson(json.decode(str));

String ratingToJson(Rating data) => json.encode(data.toJson());

class Rating {
  Rating({
    this.id,
    this.guruId,
    this.user,
    this.rating,
    this.komentar,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  int? guruId;
  double? rating;
  User? user;
  String? komentar;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        guruId: json["guruId"],
        user: User.fromJson(json['user']),
        rating: double.parse(json["rating"].toString()),
        komentar: json["komentar"],
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guruId": guruId,
        "user": user,
        "rating": rating,
        "komentar": komentar,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
      };
}
