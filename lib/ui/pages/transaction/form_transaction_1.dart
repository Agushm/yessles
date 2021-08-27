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
  return Consumer2<TransactionProvider, MapelProvider>(
      builder: (context, prov, mapel, _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          labelTextForm('Paket Pembelajaran'),
          Builder(builder: (context) {
            if (prov.paketInit && prov.listPaket.isEmpty) {
              prov.getPaket(context);
              return LinearProgressIndicator();
            }
            return DropdownButtonFormField<Map<String, dynamic>>(
              value: prov.selectedPaket,
              isExpanded: true,
              items: prov.listPaket
                  .map((e) => DropdownMenuItem<Map<String, dynamic>>(
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
            );
          }),
          labelTextForm('Jenjang Sekolah'),
          Builder(builder: (context) {
            if (mapel.schoolLevelInit && mapel.schoolLevel.isEmpty) {
              mapel.getSchoolLevel(context);
              return LinearProgressIndicator();
            }
            return DropdownButtonFormField<SchoolLevel>(
              value: mapel.schoolLevel[0],
              isExpanded: true,
              items: mapel.schoolLevel
                  .map((e) => DropdownMenuItem<SchoolLevel>(
                        child: Text('${e.jenjang}',
                            style: fontBlack.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                        value: e,
                      ))
                  .toList(),
              decoration: decorationForm,
              onChanged: (value) {
                prov.changeSelectedClass(value!);
              },
            );
          }),
          Builder(
            builder: (context) {
              if (prov.selectedClass == null) {
                return SizedBox();
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextForm('Jenjang Kelas'),
                    DropdownButtonFormField<Kelas>(
                      value: prov.selectedNumberClass,
                      isExpanded: true,
                      items: prov.selectedClass!.kelas!
                          .map((e) => DropdownMenuItem<Kelas>(
                                child: Text('${e.kelas}',
                                    style: fontBlack.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                value: e,
                              ))
                          .toList(),
                      decoration: decorationForm,
                      onChanged: (value) {
                        prov.changeSelectedNumberClass(value!);
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
