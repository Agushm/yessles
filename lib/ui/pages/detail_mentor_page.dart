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
          '${widget.teacher!.teacherName}',
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
                      image: NetworkImage(widget.teacher!.teacherImage!),
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
                        child: Text('${widget.teacher!.teacherName}',
                            style: fontBlack.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    ],
                  ),
                  Row(
                    children: [
                      StarRating(
                          rating: widget.teacher!.teacherRating,
                          starCount: 5,
                          size: 20,
                          color: Colors.yellow),
                      SizedBox(width: 5),
                      Text('${widget.teacher!.teacherRating}',
                          style: fontBlack.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w500))
                    ],
                  ),
                  SizedBox(height: 10),
                  htmlWidget(widget.teacher!.teacherAddress!),
                  SizedBox(height: 15),
                ],
              ),
            ),
            divider(),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                child: widgetReviewMapel(widget.teacher!)),
            divider(),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        child: Row(
          children: [
            Container(
              width: 40,
              child: MaterialButton(
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: ColorBase.primary, width: 2),
                  ),
                  onPressed: () {},
                  child: Icon(Icons.chat_outlined, color: ColorBase.primary)),
            ),
            SizedBox(width: 10),
            SizedBox(width: 10),
            Expanded(
              child: MaterialButton(
                  elevation: 0,
                  padding: EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  color: ColorBase.primary,
                  onPressed: () {},
                  child: Text('Review Sekarang',
                      style: fontBlack.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16))),
            ),
          ],
        ),
      ),
    );
  }
}
