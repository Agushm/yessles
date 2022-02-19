part of '../pages.dart';

class BookingTeacherPage extends StatefulWidget {
  final Teacher? teacher;

  BookingTeacherPage({Key? key, this.teacher}) : super(key: key);

  @override
  _BookingTeacherPageState createState() => _BookingTeacherPageState();
}

class _BookingTeacherPageState extends State<BookingTeacherPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController expDateController = TextEditingController();
  String? voucherMessage;

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
      body: Container(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
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
              SizedBox(height: 20),
              buildFormDate(),
              buildClassSession(),
              SizedBox(height: 20),
              labelTextForm('Voucher Promo'),
              Consumer<TransactionProvider>(builder: (context, prov, _) {
                return Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: decorationForm.copyWith(
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
                );
              }),
            ],
          ),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Bayar',
                  style: fontBlack,
                ),
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
            decoration: decorationForm,
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
              colorScheme: ColorScheme.light(),
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
          decoration: decorationForm.copyWith(hintText: 'Pilih Sesi'),
          onChanged: (value) {},
        ),
      ],
    ),
  );
}
