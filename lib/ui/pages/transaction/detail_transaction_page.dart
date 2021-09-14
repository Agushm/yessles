part of '../pages.dart';

class DetailTransactionPage extends StatefulWidget {
  //final Topup data;
  final String? payingMethod;
  final Transaction? data;
  DetailTransactionPage({this.payingMethod, this.data});
  @override
  _DetailTransactionPageState createState() => _DetailTransactionPageState();
}

class _DetailTransactionPageState extends State<DetailTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Detail Order Jadwal',
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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Text(
                'Pastikan nominal transfer dan nomor rekening sesuai yang tertera dibawah ini.',
                textAlign: TextAlign.center,
                style: fontBlack.copyWith(color: Colors.black54, fontSize: 14)),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order ID',
                        style: fontBlack.copyWith(
                            color: Colors.black38,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    Text('13998989',
                        style: fontBlack.copyWith(
                            fontSize: 15, color: Colors.black)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Nama Paket',
                        style: fontBlack.copyWith(
                            color: Colors.black38,
                            fontSize: 13,
                            fontWeight: FontWeight.w500)),
                    Text('${widget.data!.namaPaket!}'.toUpperCase(),
                        style: fontBlack.copyWith(
                            fontSize: 15, color: Colors.black)),
                  ],
                ),
                _detailDepositItem(
                  'Nominal',
                  widget.data!.harga!,
                ),
                Builder(
                  builder: (context) {
                    if (widget.data!.voucher != null) {
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Kode Voucher',
                                  style: fontBlack.copyWith(
                                      color: Colors.black38,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              Text('${widget.data!.voucher!}'.toUpperCase(),
                                  style: fontBlack.copyWith(
                                      fontSize: 15, color: Colors.black)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Diskon',
                                  style: fontBlack.copyWith(
                                      color: Colors.black38,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              Text(
                                  '- ${formatRupiah(widget.data!.diskon!)}'
                                      .toUpperCase(),
                                  style: fontBlack.copyWith(
                                      fontSize: 15, color: Colors.red)),
                            ],
                          ),
                        ],
                      );
                    }
                    return SizedBox();
                  },
                ),
                // _detailDepositItem(
                //   'Biaya Admin',
                //   widget.data.feeAdmin,
                //   isFee: true,
                //   child: GestureDetector(
                //     onTap: () {
                //       DialogUtils.instance.showInfo(context,
                //           title: 'Biaya Admin',
                //           message:
                //               'Biaya admin sebesar ${formatRupiah(widget.data.feeAdmin)} di gunakan untuk biaya perawatan sistem kami');
                //     },
                //     child: Icon(Icons.help_outline, size: 15),
                //   ),
                // ),
                SizedBox(height: 20),
                Text(
                    widget.payingMethod == 'tunai'
                        ? 'Total Bayar'
                        : 'Total Transfer',
                    style: fontBlack.copyWith(
                        fontSize: 13, color: Colors.black38)),
                Text('${formatRupiah(widget.data!.totalHarga!)}',
                    style: fontBlack.copyWith(
                        fontSize: 18,
                        color: ColorBase.green,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Builder(builder: (context) {
              if (widget.payingMethod == 'tunai') {
                return Column(
                  children: [
                    Text(
                        'Silahkan datang ke kantor Yessles untuk mengkonfirmasi pembayaran.',
                        style: fontBlack.copyWith(
                            fontSize: 12,
                            color: Colors.black54,
                            fontWeight: FontWeight.w300),
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    buildDetailTransaction(
                        title: 'Alamat Kantor',
                        content: 'Jln. Diponegoro, Tretes, Madiun, Madiun'),
                  ],
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                          'https://logos-download.com/wp-content/uploads/2016/06/Mandiri_logo.png',
                          width: 80,
                          height: 40),
                      Container(
                        width: 80,
                        child: Text('a.n, Yessles Membangun Negeri',
                            style: fontBlack.copyWith(
                                fontSize: 12, fontWeight: FontWeight.w300)),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text('No Rekening',
                        style: fontBlack.copyWith(
                            fontSize: 13, color: Colors.black38)),
                  ),
                  Center(
                    child: Text('013 6969 0000',
                        style: fontBlack.copyWith(
                            letterSpacing: 3,
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: 5),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        // copyToClipboard(
                        //     '${widget.data.bank.bankNumber}', 'Rekening Bank');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Salin Kode',
                              style: fontBlack.copyWith(
                                fontSize: 12,
                                color: ColorBase.btnCopy,
                              )),
                          SizedBox(width: 5),
                          Icon(Icons.copy, size: 10, color: ColorBase.btnCopy),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ),
          widget.payingMethod == 'tunai'
              ? SizedBox()
              : Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text('Lihat petunjuk pembayaran dibawah ini :',
                            style: fontBlack.copyWith(
                                fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                      Column(
                        children: bankMethod
                            .map((e) => ExpansionTile(
                                  title:
                                      Text('${e['method']}', style: fontBlack),
                                  children: [
                                    Container(
                                        padding: EdgeInsets.all(20),
                                        color: ColorBase.grey,
                                        child: Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child:
                                                htmlWidget(e['description']))),
                                  ],
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
          SizedBox(height: 100),
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Builder(
        builder: (context) {
          var status = 'pending';
          if (status == 'pending') {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              color: Colors.white,
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  color: ColorBase.primary,
                  onPressed: () {
                    //Get.to(ListCsScreen());
                  },
                  child: Text("Konfirmasi Pembayaran", style: fontWhite)),
            );
          } else {
            return Container(
              width: deviceWidth(context),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Status',
                    style: fontBlack.copyWith(
                        fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  Container(
                    child: Text(
                      '${status.capitalize}',
                      textAlign: TextAlign.center,
                      style: fontBlack.copyWith(
                          color: colorStatus('pending'),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

Widget _detailDepositItem(String title, int nominal,
    {bool isFee = false, Widget? child}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(title,
              style: fontBlack.copyWith(
                  color: Colors.black38,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
          SizedBox(width: 5),
          child ?? SizedBox()
        ],
      ),
      Text('${isFee ? '+' : ''}${formatRupiah(nominal)}',
          style: fontBlack.copyWith(
              fontSize: 15, color: isFee ? Colors.green : Colors.black)),
    ],
  );
}
