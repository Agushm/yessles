part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 1,
            backgroundColor: Colors.white,
            title: Text('Yessles',
                style: fontBlack.copyWith(
                    fontSize: 20,
                    color: ColorBase.primary,
                    fontWeight: FontWeight.bold))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PosterBaner(),
              Container(
                  margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
                  child: Text('Mata Pelajaran',
                      style: fontBlack.copyWith(fontSize: 18))),
              GridMapel()
            ],
          ),
        ));
  }
}
