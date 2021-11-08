part of '../widgets.dart';

class GridMapel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapelProvider>(builder: (context, prov, _) {
      if (prov.mapelInit) {
        prov.getMapel(context, isRefresh: true);
        return GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: 8,
          itemBuilder: (contex, index) {
            return Container(
              width: deviceWidth(context) / 4,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black26,
                  ),
                  SizedBox(height: 3),
                  Container(
                    width: (deviceWidth(context) - 40) / 4,
                    child: Text('',
                        textAlign: TextAlign.center,
                        style: fontBlack.copyWith(
                          fontSize: 9,
                        )),
                  ),
                ],
              ),
            );
          },
        );
      }
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: prov.mapelHome.length < 8 ? prov.mapelHome.length : 8,
        itemBuilder: (contex, index) {
          var e = prov.mapelHome[index];
          if (index == (8 - 1)) {
            return InkWell(
              onTap: () {
                Get.to(AllMapelPage());
              },
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: deviceWidth(context) / 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: ColorBase.primary.withOpacity(0.8),
                        child: Icon(Icons.more_horiz_rounded,
                            color: Colors.white, size: 35),
                      ),
                      SizedBox(height: 3),
                      Container(
                        width: (deviceWidth(context) - 40) / 4,
                        child: Text('Lihat Semua',
                            textAlign: TextAlign.center,
                            style: fontBlack.copyWith(
                              fontSize: 9,
                            )),
                      ),
                    ],
                  )),
            );
          }
          return InkWell(
            onTap: () {
              Get.to(MapelPage(e));
            },
            child: Container(
                width: deviceWidth(context) / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.contain,
                        image: e.ikon == null || e.ikon == ''
                            ? ExactAssetImage(iconsPath + 'mapel.png')
                            : NetworkImage(e.ikon!) as ImageProvider,
                      )),
                    ),
                    // CircleAvatar(
                    //   radius: 25,

                    //   backgroundImage: e.ikon == null || e.ikon == ''
                    //       ? ExactAssetImage(iconsPath + 'mapel.png')
                    //       : NetworkImage(e.ikon!) as ImageProvider,
                    //   backgroundColor: Colors.white,
                    // ),
                    SizedBox(height: 5),
                    Container(
                      width: (deviceWidth(context) - 40) / 4,
                      child: Text('${e.nama}',
                          textAlign: TextAlign.center,
                          style: fontBlack.copyWith(
                            fontSize: 10,
                          )),
                    ),
                  ],
                )),
          );
        },
      );
    });
  }
}
