part of 'models.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.nik,
    this.namaLengkap,
    this.email,
    this.phone,
    this.photoProfile,
    this.alamat,
    this.kelamin,
    this.tanggalLahir,
    this.ratingUser,
    this.ratingGuru,
    this.jwtToken,
  });

  String? id;
  dynamic nik;
  String? namaLengkap;
  String? email;
  String? phone;
  String? photoProfile;
  String? alamat;
  String? kelamin;
  DateTime? tanggalLahir;
  double? ratingUser;
  double? ratingGuru;
  String? jwtToken;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        nik: json["nik"],
        namaLengkap: json["nama_lengkap"],
        email: json["email"],
        phone: json["phone"],
        photoProfile: json["photo_profile"],
        alamat: json["alamat"],
        kelamin: json["kelamin"],
        tanggalLahir: DateTime.parse(json["tanggal_lahir"]),
        ratingUser: double.parse(json['ratingUser']),
        ratingGuru: double.parse(json['ratingGuru']),
        jwtToken: json["jwt_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nik": nik,
        "nama_lengkap": namaLengkap,
        "email": email,
        "phone": phone,
        "photo_profile": photoProfile,
        "alamat": alamat,
        "kelamin": kelamin,
        "tanggal_lahir": tanggalLahir?.toIso8601String(),
        "rating_user": ratingUser,
        "rating_guru": ratingGuru,
        "jwt_token": jwtToken,
      };
}
