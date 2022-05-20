part of '../pages.dart';

class ConfirmTransactionPage extends StatefulWidget {
  @override
  _ConfirmTransactionPageState createState() => _ConfirmTransactionPageState();
}

class _ConfirmTransactionPageState extends State<ConfirmTransactionPage> {
  final _formKey = GlobalKey<FormState>();

  String? voucherMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text('Konfirmasi Order Jadwal', style: fontAppBarTitle),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, prov, _) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                buildLabelTitle('Detail Pesanan'),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      buildDetailTransaction(
                          title: 'Paket Pembelajaran',
                          content: prov.selectedPaket!.nama),
                      buildDetailTransaction(
                          title: 'Jenjang Sekolah',
                          content: prov.selectedClass!.jenjang),
                      buildDetailTransaction(
                          title: 'Jenjang Kelas',
                          content: prov.selectedNumberClass!.kelas),
                      buildDetailTransaction(
                          title: 'Mode Pembelajaran',
                          content: prov.selectedTeachingMode!['mode']
                              ['mode_name']),
                      buildDetailTransaction(
                          title: 'Opsi',
                          content: prov.selectedTeachingMode!['mode_option']),
                      buildDetailTransactionMapel(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            child: Text(
                              'Total Harga',
                              style: fontBlack.copyWith(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Expanded(
                            child: Builder(
                              builder: (context) {
                                if (prov.selectedVoucher != null) {
                                  return Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        formatRupiah(
                                            prov.selectedPaket!.harga!),
                                        textAlign: TextAlign.right,
                                        style: fontBlack.copyWith(
                                            color: Colors.black38,
                                            fontSize: 14,
                                            decorationColor: Colors.black38,
                                            decorationThickness: 3,
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        formatRupiah(
                                            prov.selectedPaket!.harga! -
                                                prov.selectedVoucher!.diskon!),
                                        textAlign: TextAlign.right,
                                        style: fontBlack.copyWith(
                                            color: Colors.green,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  );
                                }
                                return Text(
                                  formatRupiah(prov.selectedPaket!.harga!),
                                  textAlign: TextAlign.right,
                                  style: fontBlack.copyWith(
                                      color: Colors.green,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                buildLabelTitle('Kode Promo'),
                Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 400),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Builder(
                        builder: (context) {
                          if (prov.selectedVoucher != null) {
                            return Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${prov.selectedVoucher!.voucher!}'
                                          .toUpperCase(),
                                      style: fontBlack.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  SizedBox(height: 10),
                                  buildDetailTransaction(
                                      title: 'Diskon',
                                      content: formatRupiah(
                                          prov.selectedVoucher!.diskon!)),
                                ],
                              ),
                            );
                          }
                          return SizedBox();
                        },
                      ),
                      Form(
                        key: _formKey,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: registerForm.copyWith(
                                    hintText: 'Masukan kode promo (Optional)'),
                                controller: prov.voucherTextController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Kode voucher salah';
                                  }
                                  if (voucherMessage != null) {
                                    return voucherMessage;
                                  }

                                  return null;
                                },
                              ),
                            ),
                            SizedBox(width: 5),
                            TextButton(
                                onPressed: () async {
                                  setState(() {
                                    voucherMessage = null;
                                  });
                                  if (_formKey.currentState!.validate()) {
                                    var res = await prov.cekVoucher(context);
                                    if (res == null) {
                                      setState(() {
                                        voucherMessage =
                                            'Gagal memasang voucher';
                                      });
                                    }
                                    if (res!['status'] != 'success') {
                                      setState(() {
                                        voucherMessage = res['message'];
                                      });
                                      _formKey.currentState!.validate();
                                    }
                                  }
                                },
                                child: Text('Pasang'))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: commonButton(
                btnText: 'Pilih Metode Pembayaran',
                onPressed: () async {
                  var prov =
                      Provider.of<TransactionProvider>(context, listen: false);
                  if (prov.voucherTextController.text.isNotEmpty &&
                      prov.selectedVoucher == null) {
                    DialogUtils.instance.showInfo(context,
                        title: 'Transaksi Gagal',
                        message:
                            'Anda harus menekan tombol pasang voucher terlebih dahulu',
                        btnText: 'Tutup', onPressed: () {
                      Get.back();
                    });
                    return;
                  }
                  var method = await payingMethodBottomSheet(context);
                  var _m = '';
                  if (method == 'Bayar Langsung') {
                    _m = 'tunai';
                  } else {
                    _m = 'transfer';
                  }

                  Provider.of<TransactionProvider>(context, listen: false)
                      .createTransaction(context, payMethod: _m);
                },
              ),
            ),
            cancelButton(
              btnText: 'Batal',
              onPressed: () async {
                var confirm = await DialogUtils.instance.showConfirmDialog(
                    context,
                    'Batalkan Order Jadwal',
                    'Yakin untuk membatalkan transaksi ?');
                if (confirm!) {
                  Provider.of<TransactionProvider>(context, listen: false)
                      .cancelTransaction();
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildDetailTransactionMapel() {
  return Consumer<TransactionProvider>(
    builder: (context, prov, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mata Pelajaran',
              style: fontBlack.copyWith(
                  color: Colors.black54,
                  fontSize: 12,
                  fontWeight: FontWeight.w300)),
          SizedBox(
            height: 10,
          ),
          Column(
              children: prov.selectedMapel.map(
            (e) {
              var index = prov.selectedMapel.indexOf(e);
              Teacher? teacher = prov.selectedTeacher[index]['teacher'];

              Schedule? sesi = prov.selectedTeacher[index]['sesi'];
              if (teacher == null || sesi == null) {
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${e.nama}',
                          style: fontBlack.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      SizedBox(height: 10),
                      Text(
                        'Belum memilih jadwal guru',
                        style: fontBlack.copyWith(
                            fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),
                );
              }

              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${e.nama}',
                        style: fontBlack.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                    widgetSelectTeacher(teacher, showIcon: false),
                    buildDetailTransaction(
                        title: 'Hari',
                        content: '${prov.selectedTeacher[index]['day']}'
                            .capitalizeFirst,
                        showDivider: false),
                    buildDetailTransaction(
                        title: 'Sesi (Jam)',
                        content: '${sesi.jamMulai} - ${sesi.jamSelesai}',
                        showDivider: false)
                  ],
                ),
              );
            },
          ).toList()),
          Divider(),
        ],
      );
    },
  );
}

Widget buildDetailTransaction(
    {String? title, String? content, bool? showDivider = true}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            child: Text('$title',
                style: fontBlack.copyWith(
                    color: Colors.black54,
                    fontSize: 12,
                    fontWeight: FontWeight.w300)),
          ),
          Expanded(
            child: Text('$content',
                textAlign: TextAlign.right,
                style: fontBlack.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
      showDivider! ? Divider() : SizedBox(),
    ],
  );
}
