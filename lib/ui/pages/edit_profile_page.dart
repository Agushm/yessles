part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final User? user;
  EditProfilePage({this.user});
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController hpController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // List _gender = [
  //   'Pria',
  //   'Wanita',
  // ];

  DateTime _selectedDate = DateTime.now();
  TextEditingController bornDateController = TextEditingController();

  String? selectedGender = 'Pria';

  File? imageFile;

  @override
  void initState() {
    nameController.text = widget.user!.namaLengkap!;
    emailController.text = widget.user!.email!;
    addressController.text = widget.user!.alamat!;
    hpController.text = widget.user!.phone!;
    schoolController.text = widget.user!.sekolah!;
    _selectedDate = widget.user!.tanggalLahir!;
    bornDateController
      ..text = DateFormat('dd MMMM yyyy', 'id_ID').format(_selectedDate)
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: bornDateController.text.length,
          affinity: TextAffinity.upstream));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          'Ubah Profil',
          style: fontAppBarTitle,
        ),
      ),
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
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        buildLabelTitle('Foto Profil'),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0.0, 1.0), //(x,y)
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: imageFile != null
                                        ? FileImage(imageFile)
                                        : NetworkImage(
                                            widget.user!.photoProfile!),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 5,
                                child: MaterialButton(
                                  minWidth: 20,
                                  height: 25,
                                  shape: CircleBorder(),
                                  color: ColorBase.primary,
                                  onPressed: () {
                                    showDialogGetImage();
                                  },
                                  child: Icon(Icons.settings,
                                      color: Colors.white, size: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        buildLabelTitle('Biodata'),
                        SizedBox(
                          height: 20,
                        ),
                        _buildEditProfileTextForm(
                          labelText: 'Nama Lengkap',
                          controller: nameController,
                          hintText: 'Masukkan nama lengkap',
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: TextFormField(
                            focusNode: AlwaysDisabledFocusNode(),
                            readOnly: true,
                            controller: bornDateController,
                            onTap: () {
                              _selectDate(context);
                            },
                            decoration: registerForm.copyWith(
                                labelText: 'Tanggal Lahir'),
                          ),
                        ),
                        SizedBox(height: 15),
                        // DropdownButtonFormField<String>(
                        //   value: selectedGender,
                        //   isExpanded: true,
                        //   items: _gender
                        //       .map((e) => DropdownMenuItem<String>(
                        //             child: Text(e,
                        //                 style: fontBlack.copyWith(
                        //                     fontSize: 13,
                        //                     fontWeight: FontWeight.w500)),
                        //             value: e,
                        //           ))
                        //       .toList(),
                        //   decoration:
                        //       registerForm.copyWith(labelText: 'Jenis Kelamin'),
                        //   onChanged: (value) {
                        //     setState(() {
                        //       selectedGender = value;
                        //     });
                        //   },
                        // ),
                        // SizedBox(height: 15),
                        _buildEditProfileTextForm(
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
                        _buildEditProfileTextForm(
                            labelText: 'Alamat',
                            controller: addressController,
                            hintText: 'Masukkan alamat rumah',
                            keyboardType: TextInputType.text,
                            maxLines: 4),
                        SizedBox(height: 15),
                        _buildEditProfileTextForm(
                          labelText: 'Sekolah',
                          controller: schoolController,
                          hintText: 'Masukkan nama sekolah',
                          keyboardType: TextInputType.text,
                        ),
                        SizedBox(height: 20),
                        buildLabelTitle('Kata Sandi'),
                        SizedBox(height: 20),
                        _buildEditProfileTextForm(
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
                        _buildEditProfileTextForm(
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
              DialogUtils.instance.showLoading(context, '');
              // Provider.of<UserProvider>(context, listen: false)
              //     .register(context, {
              //   "google_id": widget.user!.id,
              //   "email": widget.user!.email,
              //   "password": passwordController.text,
              //   "nama_lengkap": nameController.text,
              //   "alamat": addressController.text,
              //   "phone": hpController.text,
              //   "sekolah": schoolController.text,
              //   "photo_profile": widget.user!.photoProfile,
              //   "kelamin": selectedGender!.toLowerCase(),
              //   "tanggal_lahir":
              //       DateFormat('yyyy-MM-dd', 'id_ID').format(_selectedDate),
              // });
            }
          },
          child: Text('Simpan Perubahan',
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

  ImagePicker picker = ImagePicker();
  void showDialogGetImage() async {
    var from = await DialogUtils.instance.showGetImageFromDialog(context);
    if (from == "gallery") {
      getImage(ImageSource.gallery);
    }
    if (from == 'camera') {
      getImage(ImageSource.camera);
    }
  }

  Future getImage(ImageSource source) async {
    final pickedFile = await picker.getImage(
        source: source,
        preferredCameraDevice: CameraDevice.front,
        maxHeight: 600,
        maxWidth: 600,
        imageQuality: 40);

    setState(() {
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      } else {
        DialogUtils.instance
            .showInfo(context, title: "Gagal", message: 'Gagal memilih gambar');
      }
    });
  }
}

Widget _buildEditProfileTextForm(
    {String? labelText,
    String? hintText,
    TextEditingController? controller,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
    int? maxLines,
    bool? obscureText}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      controller: controller,
      decoration:
          registerForm.copyWith(labelText: labelText, hintText: hintText),
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
    ),
  );
}
