part of 'pages.dart';

class DetailMapelPage extends StatefulWidget {
  final Mapel? mapel;
  final SchoolLevel? schoolLevel;
  final Kelas? kelas;
  const DetailMapelPage({Key? key, this.mapel, this.schoolLevel, this.kelas})
      : super(key: key);

  @override
  _DetailMapelPageState createState() => _DetailMapelPageState();
}

class _DetailMapelPageState extends State<DetailMapelPage> {
  final _key = GlobalKey<ScaffoldState>();

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Provider.of<TeacherProvider>(context, listen: false).getTeacher(context,
        isRefresh: true,
        idMapel: widget.mapel!.id.toString(),
        idJenjang: widget.schoolLevel!.id.toString(),
        idKelas: widget.kelas!.id.toString());
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
          '${widget.mapel!.nama}',
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
            child: Consumer<TeacherProvider>(builder: (context, prov, _) {
              if (prov.teacherInit && prov.teachers.isEmpty) {
                return ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: loadingGradient),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 60,
                            height: 10,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: loadingGradient),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              if (!prov.teacherInit && prov.teachers.isEmpty) {
                return Center(child: Text('Belum ada data', style: fontBlack));
              }
              return ListView.builder(
                padding: EdgeInsets.only(left: 20),
                scrollDirection: Axis.horizontal,
                itemCount: prov.teachers.length,
                itemBuilder: (context, index) {
                  var teacher = prov.teachers[index];
                  return Container(
                    child: activeMember(teacher),
                  );
                },
              );
            }),
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
            child: Consumer<TeacherProvider>(builder: (context, prov, _) {
              if (prov.teacherInit) {
                return ListView.builder(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        gradient: loadingGradient,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    );
                  },
                );
              }
              if (!prov.teacherInit && prov.teachers.isEmpty) {
                return Center(child: Text('Belum ada data', style: fontBlack));
              }
              return ListView.builder(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                itemCount: prov.teachers.length,
                itemBuilder: (context, index) {
                  var teacher = prov.teachers[index];
                  return widgetSelectTeacher(teacher, showIcon: false);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
