part of 'pages.dart';

class DetailMapelPage extends StatefulWidget {
  final Mapel? mapel;

  const DetailMapelPage({Key? key, this.mapel}) : super(key: key);

  @override
  _DetailMapelPageState createState() => _DetailMapelPageState();
}

class _DetailMapelPageState extends State<DetailMapelPage> {
  final _key = GlobalKey<ScaffoldState>();

  PageController pageController = PageController();
  int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
        title: Text(
          '${widget.mapel!.name}',
          style: fontBlack.copyWith(
              fontSize: 14,
              color: ColorBase.primary,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Member Kelas',
              style: fontBlack.copyWith(
                  fontSize: 16,
                  color: ColorBase.primary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            width: double.infinity,
            height: 60,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 20),
              scrollDirection: Axis.horizontal,
              itemCount: widget.mapel!.teachers!.length,
              itemBuilder: (context, index) {
                var teacher = widget.mapel!.teachers![index];
                return Container(
                  child: activeMember(teacher),
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Daftar Mentor',
              style: fontBlack.copyWith(
                  fontSize: 16,
                  color: ColorBase.primary,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              itemCount: widget.mapel!.teachers!.length,
              itemBuilder: (context, index) {
                var teacher = widget.mapel!.teachers![index];
                return widgetSelectTeacher(teacher, showIcon: false);
              },
            ),
          ),
        ],
      ),
    );
  }
}
