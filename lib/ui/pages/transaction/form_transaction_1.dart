part of '../pages.dart';

class FormTransaction1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: BuildFormSession1(),
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

class BuildFormSession1 extends StatefulWidget {
  @override
  _BuildFormSession1State createState() => _BuildFormSession1State();
}

class _BuildFormSession1State extends State<BuildFormSession1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(builder: (context, prov, _) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            labelTextForm('Paket Pembelajaran'),
            Builder(builder: (context) {
              if (prov.paketInit && prov.listPaket.isEmpty) {
                prov.getPaket(context);
                return LinearProgressIndicator();
              }
              var d = prov.selectedPaket!;
              return InkWell(
                onTap: () {
                  Get.to(PackagePicker());
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text('${d.nama}', style: fontBlack),
                      ),
                      Container(color: Colors.grey[300], height: 0.5),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  children: [
                                    Text('Harga',
                                        style: fontBlack.copyWith(
                                            fontSize: 10,
                                            color: Colors.black54)),
                                    SizedBox(width: 5),
                                    Text('${formatRupiah(d.harga!)}'),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text('Sisa Kuota',
                                        style: fontBlack.copyWith(
                                            fontSize: 10,
                                            color: Colors.black54)),
                                    SizedBox(width: 5),
                                    Text('${formatInt(d.kuota!)}'),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
            prov.selectedClass == null || prov.selectedClass!.kelas!.isEmpty
                ? SizedBox()
                : Column(
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
                  ),
          ],
        ),
      );
    });
  }
}
