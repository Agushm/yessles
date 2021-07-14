part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
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
            child: Text('Yessles', style: fontBlack),
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
