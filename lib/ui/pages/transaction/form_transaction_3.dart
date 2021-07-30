part of '../pages.dart';

class FormTransaction3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: buildForm3(),
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
                onPressed: () {},
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: commonButton(
                  btnText: 'Batal',
                  btnColor: Colors.red,
                  onPressed: () {
                    Provider.of<TransactionProvider>(context, listen: false)
                        .cancelTransaction();
                    Get.back();
                    Get.back();
                    Get.back();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildForm3() {
  return Consumer<TransactionProvider>(builder: (context, prov, _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            labelTextForm('Pilih Mentor'),
            SizedBox(height: 20),
            Column(
              children: prov.selectedMapel.map(
                (e) {
                  var index = prov.selectedMapel.indexOf(e);
                  return Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${e['nama_mapel']}', style: fontBlack),
                        SizedBox(
                          height: 10,
                        ),
                        Builder(
                          builder: (context) {
                            if (prov.selectedTeacher[index] == null) {
                              return Container(
                                width: double.infinity,
                                child: btnMentor(
                                  btnText: 'Pilih Mentor',
                                  onPressed: () {
                                    teacherBottomSheet(context, index);
                                  },
                                ),
                              );
                            }

                            var teacher = prov.selectedTeacher[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    teacherBottomSheet(context, index);
                                  },
                                  child: widgetSelectTeacher(teacher),
                                ),
                                labelTextForm('Pilih Hari'),
                                DropdownButtonFormField(
                                  value: teachingDays[0],
                                  isExpanded: true,
                                  items: teachingDays
                                      .map((e) => DropdownMenuItem(
                                            child: Text('$e',
                                                style: fontBlack.copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            value: e,
                                          ))
                                      .toList(),
                                  decoration: decorationForm,
                                  onChanged: (value) {},
                                ),
                                labelTextForm('Pilih Sesi / Jam'),
                                DropdownButtonFormField(
                                  value: teachingSession[0],
                                  isExpanded: true,
                                  items: teachingSession
                                      .map((e) => DropdownMenuItem(
                                            child: Text('$e',
                                                style: fontBlack.copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            value: e,
                                          ))
                                      .toList(),
                                  decoration: decorationForm,
                                  onChanged: (value) {},
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
            SizedBox(height: 200),
          ],
        ),
      ),
    );
  });
}
