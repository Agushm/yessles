part of '../pages.dart';

class FormTransaction1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: buildFormSession1(),
      floating: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white30,
        ),
        child: commonButton(
            btnText: 'Selanjutnya',
            onPressed: () {
              Get.to(FormTransaction2());
            }),
      ),
    );
  }
}

Widget buildFormSession1() {
  return Consumer<TransactionProvider>(builder: (context, prov, _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labelTextForm('Paket Pembelajaran'),
          DropdownButtonFormField<Map>(
            value: transactionPaket[0],
            isExpanded: true,
            items: transactionPaket
                .map((e) => DropdownMenuItem<Map>(
                      child: Text('${e['nama']}',
                          style: fontBlack.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                      value: e,
                    ))
                .toList(),
            decoration: decorationForm,
            onChanged: (value) {
              prov.changeSelectedPaket(value!);
            },
          ),
          labelTextForm('Jenjang Sekolah'),
          DropdownButtonFormField<Map>(
            value: transactionClass[0],
            isExpanded: true,
            items: transactionClass
                .map((e) => DropdownMenuItem<Map>(
                      child: Text('${e['class_name']}',
                          style: fontBlack.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                      value: e,
                    ))
                .toList(),
            decoration: decorationForm,
            onChanged: (value) {
              prov.changeSelectedClass(value!);
            },
          ),
          Builder(
            builder: (context) {
              if (prov.selectedClass == null) {
                return SizedBox();
              } else {
                List _classNumber = prov.selectedClass!['list_class'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextForm('Jenjang Kelas'),
                    DropdownButtonFormField(
                      value: _classNumber[0],
                      isExpanded: true,
                      items: _classNumber
                          .map((e) => DropdownMenuItem(
                                child: Text('$e',
                                    style: fontBlack.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                value: e,
                              ))
                          .toList(),
                      decoration: decorationForm,
                      onChanged: (value) {
                        //prov.changeSelectedNumberClass(value!);
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  });
}
