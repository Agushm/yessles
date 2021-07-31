part of '../pages.dart';

class TransactionTerm extends StatefulWidget {
  @override
  _TransactionTermState createState() => _TransactionTermState();
}

class _TransactionTermState extends State<TransactionTerm> {
  String htmlTerm = '''
      <p style="text-align: justify;"><span style="white-space: pre-wrap;"><h2 style="text-align: center;"><strong><span style="color: rgb(78, 148, 36);">PERHATIAN!</span></strong>
  </h2>
  <hr />
  <p><br />1. Kamu hanya dapat melakukan pengisian saldo 1 kali setiap 30 hari / saldo habis ( Rp 0 ). Ketika saldo kamu tidak nol rupiah maka kamu tidak dapat meyelesaikan pengisian saldo atau pengisian saldo tidak berhasil.
</p>
<p style="text-align: justify;"><span style="white-space: pre-wrap;"><span style="font-size: 16.4px;">2. Setiap pengisian saldo maka otomatis saldo tersebut di kalkulasi oleh sistem dengan dibagi 30. Sebagai contoh melakukan pengisian saldo Rp30.000, maka saldo akan secara otomatis terbagi menjadi 30, dimana setiap harinya kamu dapat melakukan sedekah subuh sebesar Rp1.000 dan nominal tersebut tidak dapat diubah sebelum 30 hari atau saldo habis. Dan kamu dapat melakukan pengisian saldo kembali setelah 30 hari atau saldo telah habis.</span><br /><br /><span style="font-size: 16.4px;">3. Setiap pengisian saldo di Bibit Amal kamu akan dikenakan biaya tambahan sebesar Rp2.500, dimana biaya tersebut merupakan biaya maintenance / biaya perawatan aplikasi dan sistem kami.</span><br /><br /><span style="font-size: 16.4px;">4. Saat proses sedekah subuh kamu tidak dikenai biaya apapun.</span><br /><br /><span style="font-size: 16.4px;">5. Pastikan kamu melakukan pengisian saldo sesuai intruksi dan pastikan nomor rekening yang kamu gunakan saat transfer sama dengan yang tertera di aplikasi.</span><br /></span>
</p>
<p style="text-align: justify;"><span style="white-space: pre-wrap;"><span style="font-size: 16.4px;">6. Jika menemui kendala atau ingin mengajukan pertanyaan jangan sungkan untuk menghubungi kami dengan beralih ke halaman profile kemudian pilih menu bantuan atau hubungi kami.</span></span>
</p><span style="white-space: pre-wrap;"><br />
<hr /><br /></span>
  ''';
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
    return TransactionPage(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Consumer<TransactionProvider>(
              builder: (context, prov, _) {
                return SingleChildScrollView(
                    child: Container(
                        margin: EdgeInsets.only(bottom: 100),
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: htmlWidget(htmlTerm)));
              },
            ),
      floating: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white30,
        ),
        child: commonButton(
            btnText: 'Setuju',
            onPressed: () {
              Get.off(FormTransaction1());
            }),
      ),
    );
  }
}
