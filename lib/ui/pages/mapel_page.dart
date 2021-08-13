part of 'pages.dart';

class MapelPage extends StatelessWidget {
  final int index;
  MapelPage(this.index);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        itemCount: transactionClass.length,
        itemBuilder: (context, i) {
          var _class = transactionClass[i];
          return InkWell(
            onTap: () {
              Get.to(DetailMapelPage(mapel: mockListMapel[index]));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(_class['class_name'], style: fontBlack),
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
