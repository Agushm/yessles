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
          color: Colors.white,
        ),
        child: commonButton(
            btnText: 'Selanjutnya',
            onPressed: () {
              Provider.of<TransactionProvider>(context, listen: false)
                  .resetSelectedMapel();
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
          Builder(builder: (context) {
            if (prov.paketInit && prov.listPaket.isEmpty) {
              prov.getPaket(context);
              return LinearProgressIndicator();
            }
            return Container(
              height: 60,
              child: DropdownButtonFormField<Paket>(
                value: prov.selectedPaket,
                isExpanded: true,
                isDense: false,
                itemHeight: 60,
                items: prov.listPaket
                    .map((e) => DropdownMenuItem<Paket>(
                          child: Column(
                            children: [
                              Text('${e.nama!.toUpperCase()}',
                                  style: fontBlack.copyWith(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold)),
                              Text('${formatRupiah(e.harga!)}',
                                  style: fontBlack.copyWith(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          value: e,
                        ))
                    .toList(),
                decoration: decorationForm.copyWith(),
                onChanged: (value) {
                  prov.changeSelectedPaket(value!);
                },
              ),
            );
          }),
          labelTextForm('Jenjang Sekolah'),
          Consumer<MapelProvider>(builder: (context, mapel, _) {
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
