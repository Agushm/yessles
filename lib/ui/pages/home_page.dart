part of 'pages.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> _refresh() async {
    try {
      Provider.of<UserProvider>(context, listen: false).getUserProfile(context);
      Provider.of<MapelProvider>(context, listen: false)
          .getMapel(context, isRefresh: true);
      Provider.of<ArticleProvider>(context, listen: false).getMore(context);
    } catch (err) {
      throw err;
    }
  }

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
                      fontSize: 18,
                      color: ColorBase.primary,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          actions: [
            InkWell(
              onTap: () => Get.to(CSPage()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(iconsPath + 'cs.png', width: 25, height: 25),
                    Text('CS', style: fontBlack.copyWith(fontSize: 9))
                  ],
                ),
              ),
            ),
          ],
        ),
        body: RefreshIndicator(
          onRefresh: _refresh,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PosterBaner(),
                Container(
                  width: deviceWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      buildLabelTitle('Jenjang'),
                      SizedBox(height: 20),
                      GridJenjang()
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    buildLabelTitle('Ada yang baru nih'),
                    Container(
                        width: double.infinity,
                        height: 300,
                        child: ListArticleHome()),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
