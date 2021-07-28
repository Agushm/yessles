part of 'widgets.dart';

class PosterBaner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        viewportFraction: 1,
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      items: imageSliders,
    );
  }
}

final List<Widget> imageSliders = listBanner
    .map(
      (item) => InkWell(
        onTap: () => Get.to(ArticlePage(item)),
        child: Container(
          margin: EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item['gambar'],
                      fit: BoxFit.cover, width: 1000.0),
                  // Positioned(
                  //   bottom: 0.0,
                  //   left: 0.0,
                  //   right: 0.0,
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       gradient: LinearGradient(
                  //         colors: [
                  //           Color.fromARGB(200, 0, 0, 0),
                  //           Color.fromARGB(0, 0, 0, 0)
                  //         ],
                  //         begin: Alignment.bottomCenter,
                  //         end: Alignment.topCenter,
                  //       ),
                  //     ),
                  //     padding: EdgeInsets.symmetric(
                  //         vertical: 10.0, horizontal: 20.0),
                  //     child: Text(
                  //       'No. ${imgList.indexOf(item)} image',
                  //       style: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 20.0,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              )),
        ),
      ),
    )
    .toList();
