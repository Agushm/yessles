part of 'pages.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isAgreeRules = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((value) async {
      Get.to(LoginPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: deviceHeight(context),
            width: deviceWidth(context),
            decoration: BoxDecoration(
              //color: Colors.white,
              image: new DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
                image: NetworkImage(
                    'https://images.pexels.com/photos/5428011/pexels-photo-5428011.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'),
              ),
            ),
          ),
          Positioned(
            top: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Yessles',
                style: fontWhite.copyWith(fontSize: 20),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Theme(
                data: ThemeData(
                    unselectedWidgetColor: Colors.white,
                    toggleableActiveColor: ColorBase.primary),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: isAgreeRules,
                        onChanged: (newValue) {
                          setState(() {
                            isAgreeRules = newValue;
                          });
                        }, //  <-- leading Checkbox
                      ),
                      Expanded(
                        //width: deviceWidth(context) - 100,
                        child: RichText(
                          text: TextSpan(
                            text:
                                "Dengan melakukan pendaftaran anda menyetujui ",
                            style: fontWhite.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(
                                // recognizer: new TapGestureRecognizer()
                                //   ..onTap = () => Get.to(TermPage('term')),
                                text: "Syarat & Ketentuan",
                                style: fontWhite.copyWith(
                                    color: ColorBase.primary,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: " kami",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: MaterialButton(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: ColorBase.primary,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  onPressed: () {
                    if (isAgreeRules!) {
                      Get.offAll(MainPage());
                    } else {
                      DialogUtils.instance.showInfo(context,
                          title: 'Syarat & Ketentuan',
                          message:
                              "Anda harus menyetujui syarat dan ketentuan kami",
                          btnText: 'Setuju', onPressed: () {
                        setState(() {
                          isAgreeRules = true;
                        });
                        Get.back();
                      });
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
                      SizedBox(width: 5),
                      Text('Masuk dengan Google',
                          style: fontWhite.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(height: 60),
            ],
          ),
        ],
      ),
    );
  }
}
