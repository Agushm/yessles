part of '../pages.dart';

class FormTransaction2 extends StatefulWidget {
  @override
  State<FormTransaction2> createState() => _FormTransaction2State();
}

class _FormTransaction2State extends State<FormTransaction2> {
  int? maxSelected;
  @override
  void initState() {
    String jenjang = Provider.of<TransactionProvider>(context, listen: false)
        .selectedClass!
        .jenjang!;
    if (jenjang.toLowerCase() == 'sd') {
      maxSelected = 1;
    } else {
      maxSelected = 3;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: buildForm2(maxSelected),
      floating: Consumer<TransactionProvider>(builder: (context, prov, _) {
        return Container(
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
                  btnColor: prov.selectedMapel.length < maxSelected!
                      ? Colors.grey
                      : ColorBase.primary,
                  btnText: 'Selanjutnya',
                  onPressed: () {
                    if (prov.selectedMapel.length < maxSelected!) {
                      return;
                    }
                    Get.to(FormTransaction3());
                  },
                ),
              ),
              cancelButton(
                btnText: 'Batal',
                btnColor: Colors.blue,
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
                  }
                },
              ),
            ],
          ),
        );
      }),
    );
  }
}

Widget buildForm2(int? maxSelected) {
  return Consumer2<TransactionProvider, MapelProvider>(
      builder: (context, prov, mapel, _) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                labelTextForm('Pilih $maxSelected Mata Pelajaran'),
                Builder(
                  builder: (context) {
                    if (prov.selectedMapel.isNotEmpty) {
                      return IconButton(
                        onPressed: () {
                          prov.cancelTransaction();
                        },
                        icon: Icon(Icons.rotate_left_sharp),
                        color: ColorBase.primary,
                        iconSize: 20,
                      );
                    }
                    return SizedBox();
                  },
                )
              ],
            ),
          ),
          Builder(builder: (context) {
            if (mapel.mapelInit && mapel.mapel(context).isEmpty) {
              mapel.getMapel(context);
              return GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(
                    8,
                    (index) => Container(
                      decoration: BoxDecoration(
                        gradient: loadingGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ));
            }
            return GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              children: mapel.mapel(context).map((e) {
                return InkWell(
                  onTap: () {
                    prov.addSelectedMapel(e, maxSelected);
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: deviceWidth(context) / 4,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: prov.selectedMapel.indexOf(e) != -1
                                    ? ColorBase.primary
                                    : Colors.grey.shade300,
                                width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        alignment: Alignment.center,
                        child: Text(
                          '${e.nama}',
                          textAlign: TextAlign.center,
                          style: fontBlack.copyWith(
                              color: prov.selectedMapel.indexOf(e) != -1
                                  ? Colors.black
                                  : Colors.black54,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Builder(
                        builder: (context) {
                          var no = prov.selectedMapel.indexOf(e);
                          if (no == -1) {
                            return SizedBox();
                          }
                          return Positioned(
                            top: 5,
                            left: 5,
                            child: Container(
                              child: Text(
                                '${no + 1}',
                                style: fontBlack.copyWith(
                                    color: ColorBase.primary,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }),
        ],
      ),
    );
  });
}
