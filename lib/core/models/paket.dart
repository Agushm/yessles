part of 'models.dart';

Paket paketFromJson(String str) => Paket.fromJson(json.decode(str));

String paketToJson(Paket data) => json.encode(data.toJson());

class Paket {
  Paket({
    this.id,
    this.nama,
    this.harga,
    this.kuota,
  });

  int? id;
  String? nama;
  int? harga;
  int? kuota;

  factory Paket.fromJson(Map<String, dynamic> json) => Paket(
        id: json["id"],
        nama: json["nama"],
        harga: json["harga"],
        kuota: json["kuota"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "harga": harga,
        "kuota": kuota,
      };
}
