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
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Provider.of<TeacherProvider>(context, listen: false)
        .getTeacher(context,
            isRefresh: true,
            idMapel: widget.mapel!.id.toString(),
            idJenjang: widget.schoolLevel!.id.toString(),
            idKelas: widget.kelas!.id.toString())
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final appProvider = Provider.of<AppProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: ColorBase.grey,
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
          style: fontAppBarTitle,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          //   child: Text(
          //     'Member Kelas',
          //     style: fontBlack.copyWith(
          //         fontSize: 16,
          //         color: ColorBase.primary,
          //         fontWeight: FontWeight.w500),
          //   ),
          // ),
          // Container(
          //   width: double.infinity,
          //   height: 60,
          //   child: Consumer<TeacherProvider>(builder: (context, prov, _) {
          //     if (isLoading) {
          //       return ListView.builder(
          //         padding: EdgeInsets.only(left: 20),
          //         scrollDirection: Axis.horizontal,
          //         itemCount: 5,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             margin: EdgeInsets.symmetric(horizontal: 5),
          //             child: Column(
          //               mainAxisSize: MainAxisSize.min,
          //               children: [
          //                 Container(
          //                   height: 40,
          //                   width: 40,
          //                   decoration: BoxDecoration(
          //                       shape: BoxShape.circle,
          //                       gradient: loadingGradient),
          //                 ),
          //                 SizedBox(height: 5),
          //                 Container(
          //                   width: 60,
          //                   height: 10,
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5),
          //                       gradient: loadingGradient),
          //                 ),
          //               ],
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     if (!prov.teacherInit && prov.teachers.isEmpty) {
          //       return Center(child: Text('Belum ada data', style: fontBlack));
          //     }
          //     return ListView.builder(
          //       padding: EdgeInsets.only(left: 20),
          //       scrollDirection: Axis.horizontal,
          //       itemCount: prov.teachers.length,
          //       itemBuilder: (context, index) {
          //         var teacher = prov.teachers[index];
          //         return Container(
          //           child: activeMember(teacher),
          //         );
          //       },
          //     );
          //   }),
          // ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
              color: ColorBase.primary,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Text(
              'Daftar Mentor',
              style:
                  fontWhite.copyWith(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            child: Consumer<TeacherProvider>(builder: (context, prov, _) {
              if (isLoading) {
                return GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemCount: prov.teachers.length,
                  itemBuilder: (context, index) {
                    return Container(
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
              // return ListView.builder(
              //   padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              //   itemCount: prov.teachers.length,
              //   itemBuilder: (context, index) {
              //     var teacher = prov.teachers[index];
              //     return widgetSelectTeacher(teacher, showIcon: false);
              //   },
              // );
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: prov.teachers.length,
                itemBuilder: (context, index) {
                  var teacher = prov.teachers[index];
                  return InkWell(
                    onTap: () => Get.to(DetailMentorPage(teacher: teacher)),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(teacher.photo!),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  teacher.nama!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: fontBlack.copyWith(
                                    fontSize: 11,
                                  ),
                                ),
                                StarRating(
                                    rating: teacher.totalRating!,
                                    starCount: 5,
                                    size: 15,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    color: Colors.yellow),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
