part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3)).then((value) async {
      var user = await ServicePreferances.instance.getUserData();
      if (user == null) {
        Get.offAll(LandingPage());
      } else {
        Get.offAll(MainPage());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: double.infinity,
            height: deviceHeight(context) - 150,
            alignment: Alignment.center,
            child: Image.asset(
              'assets/icons/logo.png',
              width: 80,
              height: 80,
            ),
          ),
          Text('Raih prestasimu',
              style: fontBlack.copyWith(
                color: Colors.black54,
              ))
        ],
      ),
    );
  }
}
