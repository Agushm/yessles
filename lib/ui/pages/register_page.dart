part of 'pages.dart';

class RegisterPage extends StatefulWidget {
  final GoogleSignInAccount? googleAccount;
  RegisterPage({this.googleAccount});
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List _gender = [
    'Pria',
    'Wanita',
  ];

  DateTime _selectedDate = DateTime.now();
  TextEditingController bornDateController = TextEditingController();

  String? selectedGender = 'Pria';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceHeight(context),
            width: deviceWidth(context),
            decoration: BoxDecoration(
              color: Colors.white,
              // image: new DecorationImage(
              //   fit: BoxFit.cover,
              //   colorFilter: new ColorFilter.mode(
              //       Colors.black.withOpacity(0.9), BlendMode.dstATop),
              //   image: NetworkImage(
              //       'https://image.freepik.com/free-photo/school-office-tools-white-background_1249-663.jpg'),
              // ),
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar',
                          style: fontBlack.copyWith(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        _buildTextForm(
                          labelText: 'Nama Lengkap',
                          controller: nameController,
                          hintText: 'Masukkan nama lengkap',
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          focusNode: AlwaysDisabledFocusNode(),
                          readOnly: true,
                          controller: bornDateController,
                          onTap: () {
                            _selectDate(context);
                          },
                          decoration:
                              registerForm.copyWith(labelText: 'Tanggal Lahir'),
                        ),
                        SizedBox(height: 15),
                        DropdownButtonFormField<String>(
                          value: selectedGender,
                          isExpanded: true,
                          items: _gender
                              .map((e) => DropdownMenuItem<String>(
                                    child: Text(e,
                                        style: fontBlack.copyWith(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500)),
                                    value: e,
                                  ))
                              .toList(),
                          decoration:
                              registerForm.copyWith(labelText: 'Jenis Kelamin'),
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        SizedBox(height: 15),
                        _buildTextForm(
                            labelText: 'Nomor WhatsApp',
                            controller: hpController,
                            hintText: '081xxxxxxxxx',
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Harus diisi';
                              }
                              if (!value.isNumericOnly) {
                                return 'Masukan hanya angka saja';
                              }
                            }),
                        SizedBox(height: 15),
                        _buildTextForm(
                            labelText: 'Alamat',
                            controller: addressController,
                            hintText: 'Masukkan alamat rumah',
                            keyboardType: TextInputType.text,
                            maxLines: 4),
                        SizedBox(height: 15),
                        _buildTextForm(
                          labelText: 'Sekolah',
                          controller: schoolController,
                          hintText: 'Masukkan nama sekolah',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 15),
                        _buildTextForm(
                          labelText: 'Password',
                          controller: passwordController,
                          obscureText: true,
                          hintText: 'Masukkan Password',
                          validator: (value) {
                            if (value!.length < 6) {
                              return 'Password minimal 6 karakter';
                            }
                          },
                        ),
                        SizedBox(height: 15),
                        _buildTextForm(
                          labelText: 'Konfirmasi Password',
                          obscureText: true,
                          hintText: 'Masukkan Ulang Password',
                          validator: (value) {
                            if (value!.isNotEmpty &&
                                value != passwordController.text) {
                              return 'Password tidak sama';
                            }
                          },
                        ),
                        SizedBox(height: deviceHeight(context) / 2),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      resizeToAvoidBottomInset: false,
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
        decoration: BoxDecoration(color: Colors.white),
        child: MaterialButton(
          height: 50,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          color: ColorBase.primary,
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Provider.of<UserProvider>(context, listen: false)
                  .register(context, {
                "google_id": widget.googleAccount!.id,
                "email": widget.googleAccount!.email,
                "password": passwordController.text,
                "nama_lengkap": nameController.text,
                "alamat": addressController.text,
                "phone": hpController.text,
                "sekolah": schoolController.text,
                "photo_profile": widget.googleAccount!.photoUrl,
                "kelamin": selectedGender!.toLowerCase(),
                "tanggal_lahir":
                    DateFormat('yyyy-MM-dd', 'id_ID').format(_selectedDate),
              });
            }
          },
          child: Text('Daftar',
              style: fontWhite.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: DateTime(1980),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: ColorBase.primary,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: ColorBase.primary,
              ),
              dialogBackgroundColor: Colors.black54,
            ),
            child: child!,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      bornDateController
        ..text = DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: bornDateController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

TextFormField _buildTextForm(
    {String? labelText,
    String? hintText,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int? maxLines,
    bool? obscureText}) {
  return TextFormField(
    controller: controller,
    decoration: registerForm.copyWith(labelText: labelText, hintText: hintText),
    keyboardType: keyboardType ?? TextInputType.text,
    textInputAction: textInputAction ?? TextInputAction.next,
    maxLines: maxLines ?? 1,
    obscureText: obscureText ?? false,
    validator: validator ??
        (value) {
          if (value!.isEmpty) {
            return 'Maaf harus diisi';
          }
        },
  );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
