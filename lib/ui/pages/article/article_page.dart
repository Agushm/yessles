part of '../pages.dart';

class ArticlePage extends StatefulWidget {
  final Article data;
  ArticlePage(this.data);
  @override
  _ArticlePageState createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: Text(
          '${widget.data.judul}',
          style: fontAppBarTitle,
        ),
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_rounded),
          iconSize: 15,
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(widget.data.judul!,
                  style: fontBlack.copyWith(
                      fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                  '${tanggalBerita(widget.data.updatedAt!, withTime: true)}',
                  style: fontBlack.copyWith(
                    fontSize: 12,
                  )),
            ),
            SizedBox(height: 10),
            InkWell(
                onTap: () =>
                    null, //dialogPhotoView(context, imageUrl: widget.data['gambar']),
                child: Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.data.thumbnail!),
                    ),
                  ),
                )),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: htmlWidget(widget.data.deskripsi!)),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
