part of '../widgets.dart';

class GridJenjang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MapelProvider>(builder: (context, prov, _) {
      if (prov.schoolLevelInit) {
        prov.getSchoolLevel(context);
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
        itemCount: prov.schoolLevel.length < 8 ? prov.schoolLevel.length : 8,
        itemBuilder: (contex, index) {
          var e = prov.schoolLevel[index];
          if (index == (8 - 1)) {
            return InkWell(
              onTap: () {
                Get.to(AllSchoolLevelPage());
              },
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  width: deviceWidth(context) / 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: ColorBase.primary),
                        child: Icon(Icons.more_horiz_rounded,
                            color: Colors.white, size: 35),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: (deviceWidth(context) - 40) / 4,
                        child: Text('Lihat Semua',
                            textAlign: TextAlign.center,
                            style: fontBlack.copyWith(
                              fontSize: 10,
                            )),
                      ),
                    ],
                  )),
            );
          }
          return InkWell(
            onTap: () {
              Get.to(ClassPage(e));
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
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.contain,
                          colorFilter: e.icon == null
                              ? ColorFilter.mode(
                                  Colors.white70,
                                  BlendMode.saturation,
                                )
                              : null,
                          image: e.icon == null || e.icon == ''
                              ? ExactAssetImage(iconsPath + 'logo.png')
                              : NetworkImage(e.icon!) as ImageProvider,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: (deviceWidth(context) - 40) / 4,
                      child: Text('${e.jenjang}',
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
