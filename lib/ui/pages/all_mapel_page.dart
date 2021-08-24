part of 'pages.dart';

class AllMapelPage extends StatefulWidget {
  @override
  _AllMapelPageState createState() => new _AllMapelPageState();
}

class _AllMapelPageState extends State<AllMapelPage> {
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
          'Mata Pelajaran',
          style: fontBlack.copyWith(
              fontSize: 14,
              color: ColorBase.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 20),
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: mockListMapel.length,
        itemBuilder: (contex, index) {
          var e = mockListMapel[index];

          return InkWell(
            onTap: () {
              Get.to(MapelPage(e));
            },
            child: Container(
                width: deviceWidth(context) / 4,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    CircleAvatar(
                      radius: 26,
                      backgroundImage: NetworkImage(index % 2 != 0
                          ? 'https://image.flaticon.com/icons/png/512/2232/2232688.png'
                          : 'https://image.flaticon.com/icons/png/512/501/501405.png'),
                    ),
                    SizedBox(height: 3),
                    Container(
                      width: (deviceWidth(context) - 40) / 4,
                      child: Text('${e.name}',
                          textAlign: TextAlign.center,
                          style: fontBlack.copyWith(
                            fontSize: 9,
                          )),
                    ),
                  ],
                )),
          );
        },
      ),
    );
  }
}
