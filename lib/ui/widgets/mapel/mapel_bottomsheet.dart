part of '../widgets.dart';

mapelBottomSheet(BuildContext? context) {
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
        padding: EdgeInsets.only(
            left: 10,
            right: 10,
            top: 20,
            bottom: MediaQuery.of(context).viewInsets.bottom),
        height: 300,
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemCount: mapel.length,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                width: deviceWidth(context),
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mapel[index]["nama_mapel"],
                      style: fontBlack.copyWith(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios_rounded)
                  ],
                ),
              );
            }),
      );
    },
  );
}
