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
  TextEditingController hpController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List _gender = [
    'Pria',
    'Wanita',
  ];

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
                    height: 150,
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
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nama Lengkap',
                                  style: fontBlack.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: nameController,
                                decoration: decorationForm.copyWith(
                                    hintText: 'Masukkan Nama Lengkap'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harus diisi';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Nomor WhatsApp',
                                  style: fontBlack.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: hpController,
                                decoration: decorationForm.copyWith(
                                    hintText: 'Masukkan Nomor WhatsApp'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harus diisi';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Sekolah',
                                  style: fontBlack.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: schoolController,
                                decoration: decorationForm.copyWith(
                                    hintText: 'Masukkan Nama Sekolah'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harus diisi';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Password',
                                  style: fontBlack.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: decorationForm.copyWith(
                                    hintText: 'Masukkan Password'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Harus disi';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Konfirmasi Password',
                                  style: fontBlack.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              SizedBox(height: 5),
                              TextFormField(
                                obscureText: true,
                                decoration: decorationForm.copyWith(
                                    hintText: 'Masukkan Ulang Password'),
                                validator: (value) {
                                  if (value!.isNotEmpty &&
                                      value != passwordController.text) {
                                    return 'Password tidak sama';
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
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
                          decoration: decorationForm,
                          onChanged: (value) {
                            setState(() {
                              selectedGender = value;
                            });
                          },
                        ),
                        SizedBox(height: 20),
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
      floatingActionButton: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
        decoration: BoxDecoration(color: Colors.white),
        child: MaterialButton(
          height: 50,
          elevation: 0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          color: ColorBase.primary,
          padding: EdgeInsets.symmetric(vertical: 10),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // If the form is valid, display a snackbar. In the real world,
              // you'd often call a server or save the information in a database.
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Processing Data')),
              );
            }
          },
          child: Text('Daftar',
              style: fontWhite.copyWith(
                  fontSize: 14, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}
