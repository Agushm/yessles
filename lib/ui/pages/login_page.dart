part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBase.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () => Get.back(),
            color: Colors.black,
            icon: Icon(Icons.arrow_back)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login Dengan Handphone',
                style: fontBlack.copyWith(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(1, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    60.0,
                  ),
                ),
                child: TextFormField(
                  controller: emailController,
                  decoration:
                      loginInputDecoration.copyWith(hintText: 'Nomor HP'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Masukan email atau nomor WhatsApp';
                    }
                  },
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(1, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(
                    60.0,
                  ),
                ),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration:
                      loginInputDecoration.copyWith(hintText: 'Password'),
                  validator: (value) {
                    if (value!.length < 6) {
                      return 'Password tidak valid';
                    }
                  },
                ),
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: Text('Lupa password ?',
                    style: fontBlack.copyWith(
                        fontSize: 13, color: Colors.black54)),
              ),
              Expanded(child: SizedBox()),
              Container(
                width: double.infinity,
                child: MaterialButton(
                  elevation: 0,
                  height: 50,
                  color: ColorBase.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<UserProvider>(context, listen: false)
                          .loginPhone(context, {
                        'email': emailController.text,
                        'password': passwordController.text
                      });
                    }
                  },
                  child: Text('Login', style: fontWhite),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
