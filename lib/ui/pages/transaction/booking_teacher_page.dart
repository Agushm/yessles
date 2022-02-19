part of '../pages.dart';

class BookingTeacherPage extends StatefulWidget {
  final Teacher? teacher;

  BookingTeacherPage({Key? key, this.teacher}) : super(key: key);

  @override
  _BookingTeacherPageState createState() => _BookingTeacherPageState();
}

class _BookingTeacherPageState extends State<BookingTeacherPage> {
  final TextEditingController expDateController = TextEditingController();
  @override
  void initState() {
    expDateController
      ..text = DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate)
      ..selection = TextSelection.fromPosition(
        TextPosition(
            offset: expDateController.text.length,
            affinity: TextAffinity.upstream),
      );
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
        title: Text('Pesan Jadwal', style: fontAppBarTitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.teacher!.photo),
                    radius: 40,
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: deviceWidth(context) / 2,
                    child: Column(
                      children: [
                        Text(
                          '${widget.teacher!.nama}',
                          maxLines: 2,
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: [
                            StarRating(
                                rating: widget.teacher!.totalRating,
                                starCount: 5,
                                size: 15,
                                color: Colors.yellow),
                            SizedBox(width: 5),
                            Text(widget.teacher!.totalRating.toString(),
                                style: fontBlack.copyWith(
                                    fontSize: 11, color: Colors.black54)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(children: [
                buildFormDate(),
                buildClassSession(),
                buildMetodePembelajaran(),
              ]),
            ),
            VoucherForm(),
            totalFee(),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Total Bayar',
                  style: fontBlack,
                ),
                SizedBox(
                  width: 5,
                ),
                InkWell(
                  onTap: () {
                    DialogUtils.instance.showInfo(
                      context,
                      message: 'Biaya ini dipotong dari saldo deposit anda.',
                    );
                  },
                  child: Icon(
                    Icons.help_outline,
                    size: 15,
                    color: ColorBase.primary,
                  ),
                ),
                Spacer(),
                Text(
                  '${formatRupiah(35000)}',
                  style: fontBlack.copyWith(
                    color: ColorBase.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              child: MaterialButton(
                elevation: 0,
                padding: EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: ColorBase.primary,
                onPressed: () {},
                child: Text(
                  'Pesan Jadwal',
                  style: fontBlack.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildFormDate() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelTextForm('Tanggal Belajar'),
          SizedBox(height: 5),
          TextFormField(
            focusNode: AlwaysDisabledFocusNode(),
            readOnly: true,
            controller: expDateController,
            style: fontBlack,
            onTap: () {
              _selectDate(context);
            },
            decoration: registerForm,
          ),
        ],
      ),
    );
  }

  DateTime _selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2150),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: ColorBase.primary,
              colorScheme: ColorScheme.light(primary: ColorBase.primary),
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      expDateController
        ..text = DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: expDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

List<String> sesiBelajar = ["09.00 - 11.00", "14.30 - 16.30", "18.30 - 20.30"];
Widget buildClassSession() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        labelTextForm('Sesi'),
        DropdownButtonFormField<String>(
          value: null,
          isExpanded: true,
          items: sesiBelajar
              .map(
                (e) => DropdownMenuItem<String>(
                  child: Text(e,
                      style: fontBlack.copyWith(
                          fontSize: 13, fontWeight: FontWeight.w500)),
                  value: e,
                ),
              )
              .toList(),
          decoration: registerForm.copyWith(hintText: 'Pilih Sesi'),
          onChanged: (value) {},
        ),
      ],
    ),
  );
}

Widget buildMetodePembelajaran() {
  return Consumer<TransactionProvider>(
    builder: (context, prov, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelTextForm('Metode Pembelajaran'),
          DropdownButtonFormField<Map>(
            value: prov.selectedTeachingMode!['mode'],
            isExpanded: true,
            items: teachingMode
                .map((e) => DropdownMenuItem<Map>(
                      child: Text('${e['mode_name']}',
                          style: fontBlack.copyWith(
                              fontSize: 13, fontWeight: FontWeight.w500)),
                      value: e,
                    ))
                .toList(),
            decoration: registerForm,
            onChanged: (value) {
              prov.changeSelectedTeachingModeName(value!);
            },
          ),
          Builder(
            builder: (context) {
              if (prov.selectedTeachingMode!['mode'] != null) {
                List opsi = prov.selectedTeachingMode!['mode']['mode_options'];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    labelTextForm('Pilihan'),
                    DropdownButtonFormField<String>(
                      value: opsi[0],
                      isExpanded: true,
                      items: opsi
                          .map((e) => DropdownMenuItem<String>(
                                child: Text('$e',
                                    style: fontBlack.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                value: e,
                              ))
                          .toList(),
                      decoration: registerForm,
                      onChanged: (value) {
                        prov.changeSelectedTeachingModeOption(value!);
                      },
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
          Builder(
            builder: (context) {
              var _opsi = prov.selectedTeachingMode!['mode_option'];
              if (_opsi != null && _opsi == 'Rumah') {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: ColorBase.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                          'Masukan jarak rumah ke kantor Yessles untuk menghitung biaya transportasi',
                          style: fontWhite.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w300)),
                    ),
                    labelTextForm('Jarak Rumah (Km)'),
                    TextFormField(
                      decoration: registerForm.copyWith(
                          hintText: 'Masukkan jarak rumah ke kantor Yessles'),
                    ),
                  ],
                );
              }
              return SizedBox();
            },
          ),
        ],
      );
    },
  );
}

Widget totalFee() {
  return Consumer<TransactionProvider>(builder: (context, prov, _) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildLabelTitle('Total Bayar'),
        Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 400),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Biaya Mentor',
                      style: fontBlack.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(
                    formatInt(35000),
                    style: fontBlack.copyWith(
                        fontSize: 14,
                        color: ColorBase.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Builder(builder: (context) {
                var _opsi = prov.selectedTeachingMode!['mode_option'];
                if (_opsi != null && _opsi == 'Rumah') {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Biaya Transport',
                          style: fontBlack.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500)),
                      Text(
                        formatInt(5000),
                        style: fontBlack.copyWith(
                            fontSize: 14,
                            color: ColorBase.primary,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  );
                }
                return SizedBox();
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Promo',
                      style: fontBlack.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w500)),
                  Text(
                    formatInt(5000),
                    style: fontBlack.copyWith(
                        fontSize: 14,
                        color: ColorBase.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Bayar',
                      style: fontBlack.copyWith(
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  Text(
                    formatRupiah(40000),
                    style: fontBlack.copyWith(
                        fontSize: 16,
                        color: ColorBase.primary,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  });
}

class VoucherForm extends StatefulWidget {
  const VoucherForm({Key? key}) : super(key: key);

  @override
  _VoucherFormState createState() => _VoucherFormState();
}

class _VoucherFormState extends State<VoucherForm> {
  final _formKey = GlobalKey<FormState>();
  String? voucherMessage;
  @override
  Widget build(BuildContext context) {
    return Consumer<TransactionProvider>(
      builder: (context, prov, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildLabelTitle('Kode Promo'),
            Container(
              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Builder(
                    builder: (context) {
                      if (prov.selectedVoucher != null) {
                        return Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${prov.selectedVoucher!.voucher!}'
                                      .toUpperCase(),
                                  style: fontBlack.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 10),
                              buildDetailTransaction(
                                  title: 'Diskon',
                                  content: formatRupiah(
                                      prov.selectedVoucher!.diskon!)),
                            ],
                          ),
                        );
                      }
                      return SizedBox();
                    },
                  ),
                  Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: registerForm.copyWith(
                                hintText: 'Masukan kode promo (Optional)'),
                            controller: prov.voucherTextController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Kode voucher salah';
                              }
                              if (voucherMessage != null) {
                                return voucherMessage;
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 5),
                        TextButton(
                            onPressed: () async {
                              setState(() {
                                voucherMessage = null;
                              });
                              if (_formKey.currentState!.validate()) {
                                var res = await prov.cekVoucher(context);
                                if (res == null) {
                                  setState(() {
                                    voucherMessage = 'Gagal memasang voucher';
                                  });
                                }
                                if (res!['status'] != 'success') {
                                  setState(() {
                                    voucherMessage = res['message'];
                                  });
                                  _formKey.currentState!.validate();
                                }
                              }
                            },
                            child: Text('Pasang'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
