part of '../pages.dart';

class HistoryOrdersPage extends StatelessWidget {
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
        title: Text('Riwayat Berlangganan', style: fontAppBarTitle),
      ),
      body: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text('Paket Private SD', style: fontBlack),
                  ),
                  Container(color: Colors.grey[200], height: 0.5),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Nama Mentor',
                                style: fontBlack.copyWith(
                                    fontSize: 10, color: Colors.black54)),
                            SizedBox(width: 5),
                            Text('John Wich'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Mapel',
                                style: fontBlack.copyWith(
                                    fontSize: 10, color: Colors.black54)),
                            SizedBox(width: 5),
                            Text('SD'),
                          ],
                        ),
                        Row(
                          children: [
                            Text('Pertemuan',
                                style: fontBlack.copyWith(
                                    fontSize: 10, color: Colors.black54)),
                            SizedBox(width: 5),
                            Text('30x'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
