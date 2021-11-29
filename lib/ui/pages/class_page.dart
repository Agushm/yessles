part of 'pages.dart';

class ClassPage extends StatelessWidget {
  final SchoolLevel data;
  ClassPage(this.data);
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
          'Jenjang ${data.jenjang}'.toUpperCase(),
          style: fontAppBarTitle,
        ),
      ),
      body: Consumer<MapelProvider>(
        builder: (context, prov, _) {
          return ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 20),
            itemCount: data.kelas!.length,
            itemBuilder: (context, i) {
              var _class = data.kelas![i];
              return InkWell(
                onTap: () {
                  Get.to(MapelPage(_class));
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Kelas ${_class.kelas!}', style: fontBlack),
                      Icon(Icons.arrow_forward_ios,
                          size: 15, color: ColorBase.primary)
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
