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
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text('${d.nama}', style: fontBlack),
                    ),
                    Container(color: Colors.grey[300], height: 0.5),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Text('Harga',
                                      style: fontBlack.copyWith(
                                          fontSize: 10, color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Text('${formatRupiah(d.harga!)}'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Sisa Kuota',
                                      style: fontBlack.copyWith(
                                          fontSize: 10, color: Colors.black54)),
                                  SizedBox(width: 5),
                                  Text('${formatInt(d.kuota!)}'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
