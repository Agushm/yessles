// To parse this JSON data, do
//
//     final voucher = voucherFromJson(jsonString);

import 'dart:convert';

Voucher voucherFromJson(String str) => Voucher.fromJson(json.decode(str));

String voucherToJson(Voucher data) => json.encode(data.toJson());

class Voucher {
  Voucher({
    this.id,
    this.nama,
    this.voucher,
    this.diskon,
  });

  int? id;
  String? nama;
  String? voucher;
  int? diskon;

  factory Voucher.fromJson(Map<String, dynamic> json) => Voucher(
        id: json["id"],
        nama: json["nama"],
        voucher: json["voucher"],
        diskon: json["diskon"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "voucher": voucher,
        "diskon": diskon,
      };
}
