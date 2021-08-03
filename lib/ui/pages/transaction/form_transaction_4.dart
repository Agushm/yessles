part of '../pages.dart';

class FormTransaction4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: buildFormSession4(),
      floating: Container(
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
                btnText: 'Selanjutnya',
                onPressed: () {
                  Get.to(ConfirmTransactionPage());
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
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildFormSession4() {
  return Consumer<TransactionProvider>(builder: (context, prov, _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labelTextForm('Metode Pembelajaran'),
          DropdownButtonFormField<Map>(
            value: prov.selectedTeachingMode!['mode'],
            isExpanded: true,
            items: teachingMode
                .map((e) => DropdownMenuItem<Map>(
                      child: Text('${e['mode_name']}',
                          style: fontBlack.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                      value: e,
                    ))
                .toList(),
            decoration: decorationForm,
            onChanged: (value) {
              prov.changeSelectedTeachingModeName(value!);
            },
          ),
          Builder(
            builder: (context) {
              if (prov.selectedTeachingMode!['mode'] != null) {
                List opsi = prov.selectedTeachingMode!['mode']['mode_options'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextForm('Pilihan'),
                    DropdownButtonFormField<String>(
                      value: opsi[0],
                      isExpanded: true,
                      items: opsi
                          .map((e) => DropdownMenuItem<String>(
                                child: Text('$e',
                                    style: fontBlack.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                value: e,
                              ))
                          .toList(),
                      decoration: decorationForm,
                      onChanged: (value) {
                        prov.changeSelectedTeachingModeOption(value!);
                      },
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
          Builder(
            builder: (context) {
              var _opsi = prov.selectedTeachingMode!['mode_option'];
              if (_opsi != null && _opsi == 'Rumah') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorBase.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          'Masukan jarak rumah ke kantor Yessles untuk menghitung biaya transportasi',
                          style: fontWhite),
                    ),
                    labelTextForm('Jarak Rumah (Km)'),
                    TextFormField(
                      decoration: decorationForm.copyWith(
                          hintText: 'Masukkan jarak rumah ke kantor Yessles'),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      ),
    );
  });
}
