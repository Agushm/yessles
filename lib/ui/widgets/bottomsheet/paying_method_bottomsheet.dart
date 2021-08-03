part of '../widgets.dart';

payingMethodBottomSheet(BuildContext? context) {
  return showModalBottomSheet(
    context: context!,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    builder: (context) {
      return Container(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Consumer<TransactionProvider>(
          builder: (context, prov, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Text('Pilih Metode Pembayaran',
                        style: fontBlack.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold))),
                Container(
                  height: deviceWidth(context) / 2,
                  child: ListView.builder(
                    itemCount: payingMethod.length,
                    itemBuilder: (context, i) {
                      return InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ColorBase.primary,
                            borderRadius: BorderRadius.circular(60),
                          ),
                          alignment: Alignment.center,
                          child: Text(payingMethod[i], style: fontWhite),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}
