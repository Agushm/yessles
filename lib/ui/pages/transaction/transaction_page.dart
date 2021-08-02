part of '../pages.dart';

class TransactionPage extends StatelessWidget {
  final Widget? body;
  final Widget? floating;
  TransactionPage({this.body, this.floating});
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
          'Order Jadwal',
          style: fontBlack.copyWith(
              fontSize: 14,
              color: ColorBase.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: body,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floating,
    );
  }
}

Widget labelTextForm(String? label) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text('$label',
        style: fontBlack.copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
  );
}
