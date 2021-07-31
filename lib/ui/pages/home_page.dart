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
            title: Text('Yessles',
                style: fontBlack.copyWith(
                    fontSize: 20,
                    color: ColorBase.primary,
                    fontWeight: FontWeight.bold))),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              PosterBaner(),
              SizedBox(height: 10),
              Container(
                width: deviceWidth(context),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Wajib kamu coba',
                            style: fontBlack.copyWith(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text('Lihat semua',
                            style: fontBlack.copyWith(
                                fontSize: 12, color: Colors.blue))
                      ],
                    ),
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
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Divider(),
                            ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 80),
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: listBerita.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = listBerita[index];
                          return InkWell(
                            onTap: () => Get.to(ArticlePage(data)),
                            child: Container(
                              margin: EdgeInsets.all(5),
                              width: 300,
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(
                                        0, 1), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                      child: Container(
                                    width: 320,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image:
                                                NetworkImage(data['gambar']))),
                                  )),
                                  Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${data['judul']}',
                                            style: fontBlack.copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Container(
                                            width: 300,
                                            child: Text(
                                              '${parseHtmlString(data['deskripsi'])}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: fontBlack.copyWith(
                                                color: Colors.black54,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
