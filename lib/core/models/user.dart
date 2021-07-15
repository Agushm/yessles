part of 'models.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.image,
    this.gender,
    this.bornDate,
    this.email,
    this.phone,
    this.password,
  });

  String? name;
  String? image;
  String? gender;
  DateTime? bornDate;
  String? email;
  String? phone;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        image: json["image"],
        gender: json["gender"],
        bornDate: json["born_date"] == null
            ? null
            : DateTime.parse(json["born_date"]),
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "gender": gender,
        "born_date": bornDate!.toIso8601String(),
        "email": email,
        "phone": phone,
        "password": password,
      };
}

var jsonUser = {
  "name": "John Wick",
  "image": "sdsda",
  "gender": "Pria",
  "born_date": "1969-07-20 20:18:04Z",
  "email": "asd@asd.com",
  "phone": "0898988808",
  "password": "*******"
};
User mockUser = User.fromJson(jsonUser);
