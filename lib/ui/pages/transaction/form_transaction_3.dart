part of '../pages.dart';

class FormTransaction3 extends StatefulWidget {
  @override
  _FormTransaction3State createState() => _FormTransaction3State();
}

class _FormTransaction3State extends State<FormTransaction3> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Provider.of<TransactionProvider>(context, listen: false)
        .getTeachers(context)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body:
          isLoading ? Center(child: CircularProgressIndicator()) : BuildForm3(),
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
                  var prov =
                      Provider.of<TransactionProvider>(context, listen: false);
                  if (prov.selectedTeacher[0]['sesi'] != null &&
                      prov.selectedTeacher[1]['sesi'] != null &&
                      prov.selectedTeacher[3]['sesi'] != null) {
                    Get.to(FormTransaction4());
                  } else {
                    DialogUtils.instance.showInfo(context,
                        title: '',
                        message: 'Anda belum memilih 3 jadwal pelajaran',
                        btnText: 'Tutup', onPressed: () {
                      Get.back();
                    });
                  }
                },
              ),
            ),
            cancelButton(
              btnText: 'Batal',
              onPressed: () async {
                var prov =
                    Provider.of<TransactionProvider>(context, listen: false);
                var confirm = await DialogUtils.instance.showConfirmDialog(
                    context,
                    'Batalkan Order Jadwal',
                    'Yakin untuk membatalkan transaksi ?');
                if (confirm!) {
                  prov.cancelTransaction();
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

class BuildForm3 extends StatefulWidget {
  @override
  _BuildForm3State createState() => _BuildForm3State();
}

class _BuildForm3State extends State<BuildForm3> {
  List<bool> loadingForm = [
    false,
    false,
    false,
  ];
  @override
  Widget build(BuildContext context) {
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
                          Text('${e.nama}', style: fontBlack),
                          SizedBox(
                            height: 10,
                          ),
                          Builder(
                            builder: (context) {
                              if (prov.selectedTeacher[index]['teacher'] ==
                                  null) {
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

                              var teacher =
                                  prov.selectedTeacher[index]['teacher'];
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
                                  DropdownButtonFormField<String>(
                                    value: days[0],
                                    isExpanded: true,
                                    items: days
                                        .map((e) => DropdownMenuItem<String>(
                                              child: Text(
                                                '${e.toString().capitalizeFirst}',
                                                style: fontBlack.copyWith(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              value: e,
                                            ))
                                        .toList(),
                                    decoration: decorationForm,
                                    onChanged: (value) {
                                      setState(() {
                                        loadingForm[index] = true;
                                      });
                                      prov
                                          .addSelectedTeachingDays(
                                              context, index, value!)
                                          .then((value) {
                                        setState(() {
                                          loadingForm[index] = false;
                                        });
                                      });
                                    },
                                  ),
                                  labelTextForm('Pilih Sesi / Jam'),
                                  Builder(builder: (context) {
                                    Teacher? _selectedTeacher =
                                        prov.selectedTeacher[index]['teacher'];
                                    var jadwal = _selectedTeacher!.jadwal!;
                                    if (loadingForm[index]) {
                                      return LinearProgressIndicator();
                                    }
                                    if (jadwal.isEmpty) {
                                      return Center(
                                        child: Text(
                                          'Jadwal penuh',
                                          style: fontBlack.copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      );
                                    }
                                    return DropdownButtonFormField<Schedule>(
                                      value: jadwal[0],
                                      isExpanded: true,
                                      items: jadwal
                                          .map((e) =>
                                              DropdownMenuItem<Schedule>(
                                                child: Text(
                                                    '${e.jamMulai} - ${e.jamMulai}',
                                                    style: fontBlack.copyWith(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                                value: e,
                                              ))
                                          .toList(),
                                      decoration: decorationForm,
                                      onChanged: (value) {
                                        prov.addSelectedTeachingSession(
                                            index, value!);
                                      },
                                    );
                                  }),
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
}
