part of '../pages.dart';

class FormTransaction2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TransactionPage(
      body: buildForm2(),
      floating: Consumer<TransactionProvider>(builder: (context, prov, _) {
        return Container(
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
                  btnColor: prov.selectedMapel.length < 3
                      ? Colors.grey
                      : ColorBase.primary,
                  btnText: 'Selanjutnya',
                  onPressed: () {
                    if (prov.selectedMapel.length < 3) {
                      return;
                    }
                    Get.to(FormTransaction3());
                  },
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
        );
      }),
    );
  }
}

Widget buildForm2() {
  return Consumer<TransactionProvider>(builder: (context, prov, _) {
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
                labelTextForm('Pilih 3 Mata Pelajaran'),
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
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            children: mapel.map((e) {
              return InkWell(
                onTap: () {
                  prov.addSelectedMapel(e);
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
                        '${e['nama_mapel']}',
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
          ),
        ],
      ),
    );
  });
}
