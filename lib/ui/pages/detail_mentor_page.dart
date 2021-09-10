part of 'pages.dart';

class DetailMentorPage extends StatefulWidget {
  final Teacher? teacher;

  const DetailMentorPage({Key? key, this.teacher}) : super(key: key);

  @override
  _DetailMentorPageState createState() => _DetailMentorPageState();
}

class _DetailMentorPageState extends State<DetailMentorPage> {
  final _key = GlobalKey<ScaffoldState>();

  PageController pageController = PageController();
  bool isLoading = true;
  @override
  void initState() {
    Provider.of<RatingProvider>(context, listen: false)
        .getRating(context,
            type: 'guru',
            userId: widget.teacher!.id!.toString(),
            isRefresh: true)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final appProvider = Provider.of<AppProvider>(context);

    return Consumer<TeacherProvider>(
      builder: (context, prov, _) {
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
              '${widget.teacher!.nama}',
              style: fontBlack.copyWith(
                  fontSize: 14,
                  color: ColorBase.primary,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0), //(x,y)
                            blurRadius: 1,
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(widget.teacher!.photo!),
                        )),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 250,
                            child: Text('${widget.teacher!.nama}',
                                style: fontBlack.copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border)),
                        ],
                      ),
                      Row(
                        children: [
                          StarRating(
                              rating: widget.teacher!.totalRating,
                              starCount: 5,
                              size: 20,
                              color: Colors.yellow),
                          SizedBox(width: 5),
                          Text('${widget.teacher!.totalRating}',
                              style: fontBlack.copyWith(
                                  fontSize: 18, fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(height: 10),
                      htmlWidget(widget.teacher!.deskripsi!),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
                divider(),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Builder(
                    builder: (context) {
                      if (isLoading) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return widgetReviewMapel(widget.teacher!);
                    },
                  ),
                ),
                divider(),
                SizedBox(height: 100),
              ],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(20, 5, 20, 10),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(width: 1, color: Colors.black12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 0.5,
                  blurRadius: 0,
                  offset: Offset(0, -1), // changes position of shadow
                ),
              ],
            ),
            child: MaterialButton(
              elevation: 0,
              padding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: ColorBase.primary,
              onPressed: () {
                sendReviewBottomSheet(context, widget.teacher!);
              },
              child: Text(
                'Review Sekarang',
                style: fontBlack.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 16),
              ),
            ),
          ),
        );
      },
    );
  }
}
