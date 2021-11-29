part of 'pages.dart';

class AllSchoolLevelPage extends StatefulWidget {
  @override
  _AllSchoolLevelPageState createState() => new _AllSchoolLevelPageState();
}

class _AllSchoolLevelPageState extends State<AllSchoolLevelPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
          'Jenjang',
          style: fontAppBarTitle,
        ),
      ),
      body: Consumer<MapelProvider>(builder: (context, prov, _) {
        return GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 20),
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: prov.schoolLevel.length,
          itemBuilder: (contex, index) {
            var e = prov.schoolLevel[index];

            return InkWell(
              onTap: () {
                Get.to(ClassPage(e));
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
                      SizedBox(height: 3),
                      Container(
                        width: (deviceWidth(context) - 40) / 4,
                        child: Text('${e.jenjang}',
                            textAlign: TextAlign.center,
                            style: fontBlack.copyWith(
                              fontSize: 9,
                            )),
                      ),
                    ],
                  )),
            );
          },
        );
      }),
    );
  }
}
