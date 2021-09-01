part of '../pages.dart';

class ConfirmTransactionPage extends StatelessWidget {
  ConfirmTransactionPage();
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
        title: Text(
          'Konfirmasi Order Jadwal',
          style: fontBlack.copyWith(
              fontSize: 14,
              color: ColorBase.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer<TransactionProvider>(
        builder: (context, prov, _) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 200),
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
                      content: prov.selectedTeachingMode!['mode']['mode_name']),
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
                        child: Text(formatRupiah(prov.selectedPaket!.harga!),
                            textAlign: TextAlign.right,
                            style: fontBlack.copyWith(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white30,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: double.infinity,
              child: commonButton(
                btnText: 'Pilih Metode Pembayaran',
                onPressed: () async {
                  var method = await payingMethodBottomSheet(context);
                  var _m = '';
                  if (method == 'Bayar Langsung') {
                    _m = 'tunai';
                  } else {
                    _m = 'transfer';
                  }
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
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
              if (teacher == null) {
                return Text('Belum memilih guru');
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
                        content: prov.selectedTeacher[index]['day'],
                        showDivider: false),
                    buildDetailTransaction(
                        title: 'Sesi (Jam)',
                        content: prov.selectedTeacher[index]['sesi'],
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
