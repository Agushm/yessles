part of 'models.dart';

Transaction transactionFromJson(String str) =>
    Transaction.fromJson(json.decode(str));

String transactionToJson(Transaction data) => json.encode(data.toJson());

class Transaction {
  Transaction(
      {this.namaPaket,
      this.harga,
      this.diskon,
      this.voucher,
      this.totalHarga,
      this.createdAt});

  String? namaPaket;
  int? harga;
  int? diskon;
  dynamic voucher;
  int? totalHarga;
  DateTime? createdAt;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
      namaPaket: json["nama_paket"],
      harga: json["harga"],
      diskon: json["diskon"],
      voucher: json["voucher"],
      totalHarga: json["total_harga"],
      createdAt: DateTime.parse(json['created_at']));

  Map<String, dynamic> toJson() => {
        "nama_paket": namaPaket,
        "harga": harga,
        "diskon": diskon,
        "voucher": voucher,
        "total_harga": totalHarga,
      };
}
