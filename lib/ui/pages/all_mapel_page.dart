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
      body: ListView.builder(
        itemCount: mockListMapel.length,
        itemBuilder: (context, index) {
          var mapel = mockListMapel[index];
          return InkWell(
            onTap: () {
              Get.to(MapelPage(index));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(mapel.name!, style: fontBlack),
                  Icon(Icons.arrow_forward_ios_rounded,
                      size: 15, color: ColorBase.primary),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
