part of '../widgets.dart';

class PackagePicker extends StatelessWidget {
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
        title: Text('Pilih Pembelajaran', style: fontAppBarTitle),
      ),
      body: Consumer<TransactionProvider>(builder: (context, prov, _) {
        return ListView.builder(
          padding: EdgeInsets.all(20),
          itemCount: prov.listPaket.length,
          itemBuilder: (context, index) {
            var d = prov.listPaket[index];
            return InkWell(
                onTap: () {
                  prov.changeSelectedPaket(d);
                  Get.back();
                },
                child: CourseCard(data: d));
          },
        );
      }),
    );
  }
}
