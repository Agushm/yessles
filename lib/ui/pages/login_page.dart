part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isAgreeRules = false;

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
                        'Selamat Datang di Yessles!',
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
                            Text('Email atau Nomor WhatsApp',
                                style: fontBlack.copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(height: 5),
                            TextFormField(
                              decoration: decorationForm.copyWith(
                                  hintText:
                                      'Masukkan Email atau Nomor WhatsApp'),
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
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(height: 5),
                            TextFormField(
                              obscureText: true,
                              decoration: decorationForm.copyWith(
                                  hintText: 'Masukkan Password'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        child: MaterialButton(
                          height: 50,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          color: ColorBase.primary,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            Get.offAll(MainPage());
                          },
                          child: Text('Login',
                              style: fontWhite.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w500)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        child: Row(
                          children: [
                            Expanded(
                              child:
                                  Container(height: 1, color: Colors.black54),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: Text('Atau', style: fontBlack)),
                            Expanded(
                              child:
                                  Container(height: 1, color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: MaterialButton(
                          elevation: 0,
                          height: 50,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(60)),
                          color: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          onPressed: () {
                            Get.offAll(MainPage());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 20),
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(180)),
                                child: SvgPicture.asset(
                                  'assets/icons/google.svg',
                                  width: 25,
                                  height: 25,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text('Login Dengan Google',
                                      style: fontWhite.copyWith(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
