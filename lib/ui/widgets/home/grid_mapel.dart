part of '../widgets.dart';

class GridMapel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),
        itemCount: mapel.length,
        itemBuilder: (BuildContext ctx, index) {
          if (index == 5) {
            return Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorBase.primary,
                      borderRadius: BorderRadius.circular(15)),
                ),
                Positioned(
                  top: 0,
                  right: 5,
                  child: Icon(Icons.more_horiz_rounded,
                      color: Colors.white.withOpacity(0.1), size: 65),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Lainnya",
                    style: fontWhite.copyWith(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          }
          return Stack(
            children: [
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: ColorBase.primary,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Icon(Icons.book_outlined,
                  color: Colors.white.withOpacity(0.1), size: 80),
              Container(
                alignment: Alignment.center,
                child: Text(
                  mapel[index]["nama_mapel"],
                  style: fontWhite.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
  }
}
