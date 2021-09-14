part of 'pages.dart';

class MapelPage extends StatelessWidget {
  final Mapel mapel;
  MapelPage(this.mapel);
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
          if (prov.schoolLevelInit && prov.schoolLevel.isEmpty) {
            prov.getSchoolLevel(context);
            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: 4,
              itemBuilder: (context, i) {
                return Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Colors.black26, Colors.black12]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            );
          }
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: prov.schoolLevel.length,
            itemBuilder: (context, i) {
              var _class = prov.schoolLevel[i];
              return AnimatedContainer(
                duration: Duration(milliseconds: 500),
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: ExpansionTile(
                  title: Text(_class.jenjang!,
                      style: fontBlack.copyWith(fontWeight: FontWeight.bold)),
                  childrenPadding: EdgeInsets.only(bottom: 10),
                  iconColor: ColorBase.primary,
                  children: _class.kelas!.map((e) {
                    return InkWell(
                      onTap: () {
                        Get.to(DetailMapelPage(
                            mapel: mapel, schoolLevel: _class, kelas: e));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            color: ColorBase.primary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.arrow_forward_ios_rounded,
                                size: 15, color: Colors.white),
                            SizedBox(width: 20),
                            Text(e.kelas!, style: fontWhite),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
