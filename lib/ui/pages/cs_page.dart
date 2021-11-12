part of 'pages.dart';

class CSPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Customer Service',
          style: fontAppBarTitle,
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [Text('CS $index',style:fontBlack.copyWith(
                fontSize:16,
                fontWeight: FontWeight.w500
              )),
               Text('081234567890',style:fontBlack)],
            ),
          );
        },
      ),
    );
  }
}
