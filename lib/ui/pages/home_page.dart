part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorBase.grey,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            backgroundColor: Colors.white,
            title: Row(
              children: [
                Image.asset(
                  'assets/icons/logo.png',
                  width: 30,
                  height: 30,
                ),
                SizedBox(width: 10),
                Text('Yessles',
                    style: fontBlack.copyWith(
                        fontSize: 20,
                        color: ColorBase.primary,
                        fontWeight: FontWeight.bold)),
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PosterBaner(),
              Container(
                width: deviceWidth(context),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mata Pelajaran',
                        style: fontBlack.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 20),
                    GridMapel()
                  ],
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Ada yang baru nih',
                      style: fontBlack.copyWith(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      height: 300,
                      child: ListArticle()),
                ],
              ),
            ],
          ),
        ));
  }
}
