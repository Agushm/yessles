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
        automaticallyImplyLeading: false,
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Beli Paket Pembelajaran',
          style: fontBlack.copyWith(
              fontSize: 20,
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
