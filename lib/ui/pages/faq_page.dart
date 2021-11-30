part of 'pages.dart';

class FAQPage extends StatefulWidget {
  final String? title;
  FAQPage({this.title});
  @override
  _FAQPageState createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  String htmlTerm() {
    return '''
      <div style='box-sizing: border-box; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; color: rgb(65, 65, 65); font-size: 14px; line-height: 1.6; text-align: center;'><span style="box-sizing: border-box; font-weight: bold; color: rgb(255, 0, 0); font-size: 24px;">${widget.title}</span></div>
<ol style="box-sizing: border-box;">
    <li style="box-sizing: border-box;"><span style="box-sizing: border-box; font-size: 16px;">Sebelum kamu berlangganan pastikan kamu sudah benar-benar memilih materi dan paket yang sudah kami sediakan.</span><br><br></li>
    <li style="box-sizing: border-box;"><span style="box-sizing: border-box; font-size: 16px;">Kamu bisa membayar melalui transfer bank/langsung ke kantor Yessles.</span><br><br></li>
    <li style="box-sizing: border-box;"><span style="box-sizing: border-box; font-size: 16px;">Jika kamu berhalangan untuk melakukan bimbingan, kamu bisa mengganti jadwal maksimal 4 jam sebelum pembelajaran dimulai. Jika melebihi maka tidak bisa dibatalkan.</span></li>
</ol>
<p><br></p>
<p style='box-sizing: border-box; font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; color: rgb(65, 65, 65); font-size: 14px; line-height: 1.6;'><br style="box-sizing: border-box; color: rgb(65, 65, 65); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"></p>
      ''';
  }

  bool isLoading = false;
  @override
  void initState() {
    // Provider.of<TopupProvider>(context, listen: false)
    //     .getTopupInfo(context)
    //     .then((value) {
    //   setState(() {
    //     isLoading = false;
    //   });
    // });
    super.initState();
  }

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
        title: Text('${widget.title}', style: fontAppBarTitle),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<TransactionProvider>(
              builder: (context, prov, _) {
                return SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(
                            bottom: 100, left: 10, right: 10, top: 20),
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: htmlWidget(htmlTerm())));
              },
            ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: Container(
      //   width: double.infinity,
      //   padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //   decoration: BoxDecoration(
      //     color: Colors.white,
      //   ),
      //   child: commonButton(
      //       btnText: 'Setuju',
      //       onPressed: () {
      //         Get.off(FormTransaction1());
      //       }),
      // ),
    );
  }
}
