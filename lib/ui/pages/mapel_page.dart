part of 'pages.dart';

class MapelPage extends StatelessWidget {
  final Kelas kelas;
  MapelPage(this.kelas);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          'Mata Pelajaran',
          style: fontAppBarTitle,
        ),
      ),
      body: Consumer<MapelProvider>(
        builder: (context, prov, _) {
          if (prov.mapelInit) {
            prov.getMapel(context, isRefresh: true);
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 8,
              itemBuilder: (contex, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10)),
                );
              },
            );
          }
          return GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: prov.mapelHome.length,
            itemBuilder: (contex, index) {
              var e = prov.mapelHome[index];

              return InkWell(
                onTap: () {
                  Get.to(
                    DetailMapelPage(
                      kelas: kelas,
                      mapel: e,
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          fit: BoxFit.contain,
                          image: e.ikon == null || e.ikon == ''
                              ? ExactAssetImage(iconsPath + 'mapel.png')
                              : NetworkImage(e.ikon!) as ImageProvider,
                        )),
                      ),
                      SizedBox(height: 5),
                      Container(
                        width: (deviceWidth(context) - 40) / 3,
                        child: Text('${e.nama}'.toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: fontBlack.copyWith(
                              fontSize: 12,
                            )),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
