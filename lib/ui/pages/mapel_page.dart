part of 'pages.dart';

class MapelPage extends StatelessWidget {
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
          'Materi Belajar',
          style: fontBlack.copyWith(
              fontSize: 14,
              color: ColorBase.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return ExpansionTile(
            iconColor: ColorBase.primary,
            title: Text('Bagian $i', style: fontBlack),
            backgroundColor: ColorBase.grey,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: EdgeInsets.all(20),
            children: List.generate(4, (index) {
              return InkWell(
                onTap: () {
                  Get.to(SubbabMapelPage(title: 'Sub BAB $i'));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  margin: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sub BAB $i'),
                      Icon(Icons.play_arrow_rounded, color: ColorBase.primary),
                    ],
                  ),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
